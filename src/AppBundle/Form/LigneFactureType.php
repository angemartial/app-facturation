<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;
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

            ->add('choisir', ButtonType::class, [
                'attr' => [
                    'class' => 'btn btn-info choose-article',
                    'data-toggle' => 'modal',
                    'data-target' => '#article-modal',
                    'type' => 'button'
                ],
                'label' => '+'
            ])
            ->add('reference', null, [
                'attr' => [
                    'class' => 'form-control little-form-control reference-input',
                ],
                'disabled' => true
            ])
            ->add('designation', TextareaType::class, [
                'attr' => [
                    'class' => 'form-control wide-form-control designation-input'
                ]
            ])
            ->add('prixUnitaire', null, [
                'attr' => [
                    'class' => 'form-control little-form-control pu pu-input'
                ],
                'label' => 'PU HT'
            ])
            ->add('quantite', null, [
                'attr' => [
                    'class' => 'form-control little-form-control qte'
                ],
                'label' => 'Qte'
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
                    'class' => 'form-control little-form-control total-ttc'
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
