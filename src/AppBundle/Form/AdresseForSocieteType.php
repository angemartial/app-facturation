<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AdresseForSocieteType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('adresse', null, [
                'label' => 'Adresse 1',
                'attr' => [
                    'class' => 'nested-field'
                ]
            ])
            ->add('adresseSuite',null, [
                'label' => 'Adresse 2',
                'attr' => [
                    'class' => 'nested-field'
                ]
            ])
            ->add('ville',null, [
                'label' => 'Ville',
                'attr' => [
                    'class' => 'nested-field'
                ]
            ])
            ->add('codePostal',null, [
                'label' => 'Code postal',
                'attr' => [
                    'class' => 'nested-field'
                ]
            ])
            ->add('telBureau',null, [
                'label' => 'Tèl Bureau',
                'attr' => [
                    'class' => 'nested-field'
                ]
            ])
            ->add('portable',null, [
                'label' => 'Portable',
                'attr' => [
                    'class' => 'nested-field'
                ]
            ])
            ->add('fax',null, [
                'label' => 'Fax',
                'attr' => [
                    'class' => 'nested-field'
                ]
            ])
            ->add('pays',null, [
                'label' => 'Pays',
                'attr' => [
                    'class' => 'nested-field'
                ]
            ]);
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Adresse'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_adresse';
    }


}
