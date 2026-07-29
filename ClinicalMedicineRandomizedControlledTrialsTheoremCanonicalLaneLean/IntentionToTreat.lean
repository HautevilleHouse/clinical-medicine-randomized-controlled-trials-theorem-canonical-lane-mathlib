import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure IntentionToTreatPackage (D : ClinicalTrialDesignPackage) where
  assignedTreatment : D.treatmentArm → D.population → Prop
  adherenceAssessment : Prop
  primaryAnalysisInclusive : Prop
  nonAdherenceHandling : Prop

structure IntentionToTreatEvidence {D : ClinicalTrialDesignPackage} (I : IntentionToTreatPackage D) where
  primaryAnalysisInclusiveClosed : I.primaryAnalysisInclusive
  nonAdherenceHandlingClosed : I.nonAdherenceHandling

def IntentionToTreatClosed {D : ClinicalTrialDesignPackage} (I : IntentionToTreatPackage D) : Prop :=
  I.primaryAnalysisInclusive ∧ I.nonAdherenceHandling

theorem intention_to_treat_closed_from_evidence {D : ClinicalTrialDesignPackage} (I : IntentionToTreatPackage D) (E : IntentionToTreatEvidence I) :
    IntentionToTreatClosed I := by
  exact And.intro E.primaryAnalysisInclusiveClosed E.nonAdherenceHandlingClosed

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse