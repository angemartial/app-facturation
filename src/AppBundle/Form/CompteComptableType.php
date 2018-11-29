<?php

namespace AppBundle\Form;

use AppBundle\Entity\SystemeComptable;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CompteComptableType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('numero',  null, [
                'attr' => [
                    'class' => 'form-control  '
                ],
                'label' => 'Numéro compte'
            ])
            ->add('code',  null, [
                'attr' => [
                    'class' => 'form-control  '
                ],
                'label' => 'Code du compte'
            ])
            ->add('libelle',  null, [
                'attr' => [
                    'class' => 'form-control  '
                ],
                'label' => 'Libellé'
            ])
            ->add('systemeComptable',  null, [
                'attr' => [
                    'class' => ''
                ],
                'label' => 'Sytème comptable'
            ])
            ->add('submit', SubmitType::class, [
                'attr' => [
                    'class' => 'btn btn-primary'
                ],
                'label' => 'Enregistrer'
            ]);
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\CompteComptable'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_comptecomptable';
    }


}
