import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure PharmacokineticModel where
  dose : ℝ
  volumeDistribution : ℝ
  eliminationRate : ℝ
  halfLife : ℝ

structure PharmacokineticModelEvidence (P : PharmacokineticModel) where
  dosePositive : P.dose > 0
  volumeDistributionPositive : P.volumeDistribution > 0
  eliminationRatePositive : P.eliminationRate > 0
  halfLifePositive : P.halfLife > 0
  halfLifeFormulaConsistent : P.halfLife = Real.log 2 / P.eliminationRate

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.dose > 0 ∧ P.volumeDistribution > 0 ∧
  P.eliminationRate > 0 ∧ P.halfLife > 0 ∧
  P.halfLife = Real.log 2 / P.eliminationRate

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticModelEvidence P) :
    PharmacokineticModelClosed P := by
  exact And.intro E.dosePositive
    (And.intro E.volumeDistributionPositive
      (And.intro E.eliminationRatePositive
        (And.intro E.halfLifePositive E.halfLifeFormulaConsistent)))

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse