<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AdresseType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('adresse', null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Adresse 1'
            ])
            ->add('adresseSuite',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Adresse 2'
            ])
            ->add('ville',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Ville'
            ])
            ->add('codePostal',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Code postal'
            ])
            ->add('telBureau',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Tèl Bureau'
            ])
            ->add('portable',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Portable'
            ])
            ->add('fax',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Fax'
            ])
            ->add('pays',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Pays'
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
