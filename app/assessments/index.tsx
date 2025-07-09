import { Routes } from '@/constants/Routes';
import { useRouter } from 'expo-router';
import { useEffect } from 'react';

export default function AssessmentIndex() {
  const router = useRouter();

  useEffect(() => {
    router.replace(Routes.ASSESSMENTS.STEP1);
  }, []);

  return null;
}
