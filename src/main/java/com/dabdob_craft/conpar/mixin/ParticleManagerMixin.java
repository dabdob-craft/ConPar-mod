package com.dabdob_craft.conpar.mixin;

import com.dabdob_craft.conpar.ConParMod;
import net.minecraft.client.particle.Particle;
import net.minecraft.client.particle.ParticleManager;
import net.minecraft.particle.ParticleEffect;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

@Mixin(ParticleManager.class)
public abstract class ParticleManagerMixin {

    @Inject(method = "addParticle(Lnet/minecraft/client/particle/Particle;)V", 
            at = @At("HEAD"), 
            cancellable = true)
    private void conpar$onAddParticle(Particle particle, CallbackInfoReturnable<Boolean> cir) {
        
        if (ConParMod.isManualSuppressionActive) {
            cir.setReturnValue(false); 
            return;
        }
    }
}
