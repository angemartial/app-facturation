<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EntiteType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('civilite',null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Civilité'
            ])
            ->add('nom',null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Nom'
            ])
            ->add('prenoms',null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Prénoms'
            ])
            ->add('fonction',null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Fonction'
            ])
            ->add('raisonSociale',null, [
                'attr' => [
                    'class' => 'form-control company-input'
                ],
                'label' => 'Raison sociale'
            ])
            ->add('formeJuridique',null, [
                'attr' => [
                    'class' => 'form-control company-input'
                ],
                'label' => 'Forme juridique'
            ])
            ->add('siteWeb',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Site Web'
            ])
            ->add('adresse',AdresseType::class, [
                'label' => ' '
            ])
            ->add('coordonneesBanque',CoordonneesBanqueType::class, [
                'label' => ' '
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
            'data_class' => 'AppBundle\Entity\Entite'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_entite';
    }


}
