<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class LigneFactureType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('reference', null, [
                'attr' => [
                    'class' => 'form-control little-form-control'
                ]
            ])
            ->add('designation', TextareaType::class, [
                'attr' => [
                    'class' => 'form-control widen wide-form-control'
                ]
            ])
            ->add('prixUnitaire', null, [
                'attr' => [
                    'class' => 'form-control pu'
                ],
                'label' => 'Prix unitaire HT'
            ])
            ->add('quantite', null, [
                'attr' => [
                    'class' => 'form-control little-form-control qte'
                ]
            ])
            ->add('tva', null, [
                'attr' => [
                    'class' => 'form-control tva'
                ]
            ])

            ->add('unite', null, [
                'attr' => [
                    'class' => 'form-control little-form-control'
                ]
            ])
            ->add('total', TextType::class, [
                'attr' => [
                    'class' => 'form-control total-ttc'
                ],
                'disabled' => true,
                'mapped' => false,
                'label' => 'Total TTC'
            ]);
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\LigneFacture'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_lignefacture';
    }


}
