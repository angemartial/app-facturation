<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CoordonneesBanqueType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('banque',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Banque'
            ])
            ->add('rib',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Rib'
            ])
            ->add('iban',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Iban'
            ])
            ->add('bic',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Bic'
            ])
            ->add('montantDeLencours',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Montant de l\'encours'
            ]);
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\CoordonneesBanque'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_coordonneesbanque';
    }


}
