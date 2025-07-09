import React, { createContext, ReactNode, useContext, useState } from 'react';

interface AssessmentData {
  gender?: 'male' | 'female';
  age?: number;
}

interface AssessmentContextType {
  data: AssessmentData;
  updateData: (key: keyof AssessmentData, value: any) => void;
  resetData: () => void;
}

const AssessmentContext = createContext<AssessmentContextType | undefined>(undefined);

export function AssessmentProvider({ children }: { children: ReactNode }) {
  const [data, setData] = useState<AssessmentData>({});

  const updateData = (key: keyof AssessmentData, value: any) => {
    setData(prev => ({ ...prev, [key]: value }));
  };

  const resetData = () => {
    setData({});
  };

  return (
    <AssessmentContext.Provider value={{ data, updateData, resetData }}>
      {children}
    </AssessmentContext.Provider>
  );
}

export const useAssessment = () => {
  const context = useContext(AssessmentContext);
  if (!context) {
    throw new Error('useAssessment must be used within AssessmentProvider');
  }
  return context;
};
