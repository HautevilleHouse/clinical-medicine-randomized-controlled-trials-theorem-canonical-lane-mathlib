import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure RandomizedTrial where
  treatmentArm : Type u
  controlArm : Type v
  outcomeMeasure : Type w
  randomAllocation : Prop
  blinding : Prop
  trialValid : Prop

structure RandomizedTrialDesignEvidence (T : RandomizedTrial) where
  trialValidClosed : T.trialValid

def RandomizedTrialDesignClosed (T : RandomizedTrial) : Prop :=
  T.trialValid

theorem randomized_trial_design_closed_from_evidence
    (T : RandomizedTrial) (E : RandomizedTrialDesignEvidence T) :
    RandomizedTrialDesignClosed T :=
  E.trialValidClosed

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse