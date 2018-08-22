<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MargeType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder

            ->add('prixAchatHt', null, [
        'attr' => [
            'class' => 'form-control person-input'
        ],
        'label' => "Prix d'achat HT"
    ])
            ->add('margeBrute', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => ' Marge brute'
            ])
            ->add('coefficientMultiplicateur',null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => ' Coefficient multiplicateur'
            ])
            ->add('pourcentageMarge',null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => ' % Marge'
            ]);
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Marge'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_marge';
    }


}
