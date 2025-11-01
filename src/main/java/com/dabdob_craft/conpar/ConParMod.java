package com.dabdob_craft.conpar;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.client.event.lifecycle.v1.ClientTickEvents;
import net.fabricmc.fabric.api.client.keybinding.v1.KeyBindingHelper;
import net.minecraft.client.MinecraftClient;
import net.minecraft.client.option.KeyBinding;
import net.minecraft.client.option.ParticlesMode;
import net.minecraft.client.util.InputUtil;
import org.lwjgl.glfw.GLFW;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ConParMod implements ModInitializer {
    public static final String MOD_ID = "conpar";
    public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

    private static final int FPS_THRESHOLD = 50;
    private static final float COMBAT_HEALTH_THRESHOLD = 10.0f; 
    
    private ParticlesMode originalParticleMode = ParticlesMode.ALL; 
    public static boolean isManualSuppressionActive = false;

    public static final KeyBinding TOGGLE_KEY = KeyBindingHelper.registerKeyBinding(
        new KeyBinding(
            "key.conpar.toggle_suppressor",
            InputUtil.Type.KEYSYM,
            GLFW.GLFW_KEY_K,
            "category.conpar.controls"
        )
    );

    @Override
    public void onInitialize() {
        LOGGER.info("ConPar Initializing!");

        ClientTickEvents.END_CLIENT_TICK.register(client -> {
            if (client.world != null && client.player != null) {
                
                while (TOGGLE_KEY.wasPressed()) {
                    isManualSuppressionActive = !isManualSuppressionActive;
                    LOGGER.info("ConPar Manual Toggle: {}", isManualSuppressionActive ? "ACTIVATED" : "DEACTIVATED");
                    checkConditionsAndSuppressParticles(client);
                }
                
                checkConditionsAndSuppressParticles(client);
            }
        });
    }

    private void checkConditionsAndSuppressParticles(MinecraftClient client) {
        if (isManualSuppressionActive) {
            applySuppression(client);
            return;
        }

        int currentFps = client.getCurrentFps();
        float currentHealth = client.player.getHealth(); 

        boolean shouldSuppressAutomatically = (currentFps < FPS_THRESHOLD) || (currentHealth <= COMBAT_HEALTH_THRESHOLD);

        if (shouldSuppressAutomatically) {
            applySuppression(client);
        } else {
            restoreParticles(client);
        }
    }

    private void applySuppression(MinecraftClient client) {
        if (client.options.getParticlesMode() != ParticlesMode.MINIMAL) {
            originalParticleMode = client.options.getParticlesMode(); 
            client.options.setParticlesMode(ParticlesMode.MINIMAL);
        }
    }

    private void restoreParticles(MinecraftClient client) {
        if (client.options.getParticlesMode() == ParticlesMode.MINIMAL) {
            client.options.setParticlesMode(originalParticleMode); 
        }
    }
}
