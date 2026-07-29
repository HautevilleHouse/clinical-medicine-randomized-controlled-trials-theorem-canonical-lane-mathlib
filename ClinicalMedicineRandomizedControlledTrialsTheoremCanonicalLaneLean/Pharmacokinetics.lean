import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure PharmacokineticsPackage where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationHalfLife : Prop
  aucMeasure : Prop
  bioavailability : Prop

structure PharmacokineticsEvidence (P : PharmacokineticsPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationHalfLifeClosed : P.eliminationHalfLife
  aucMeasureClosed : P.aucMeasure
  bioavailabilityClosed : P.bioavailability

def PharmacokineticsClosed (P : PharmacokineticsPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧
  P.eliminationHalfLife ∧ P.aucMeasure ∧ P.bioavailability

theorem pharmacokinetics_closed_from_evidence (P : PharmacokineticsPackage) (E : PharmacokineticsEvidence P) :
    PharmacokineticsClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationHalfLifeClosed
        (And.intro E.aucMeasureClosed E.bioavailabilityClosed)))

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse