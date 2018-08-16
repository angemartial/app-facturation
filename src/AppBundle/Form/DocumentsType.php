<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\SubmitButton;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\DateTime;

class DocumentsType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('date', TextType::class, [
                'attr' =>[
                    'class' => 'form-control datepicker'
                ]
            ])->add('dateDeLivraison',TextType::class, [
                'attr' => [
                    'class' => 'form-control datepicker'
                ]
            ]);
        $builder->get('date')
            ->addModelTransformer(new CallbackTransformer(
                function (\DateTime $date = null) {
                    // transform the array to a string
                    return $date === null ? '' : $date->format('d m Y');
                },
                function ($string) {
                    // transform the string back to an array
                    return \DateTime::createFromFormat('d m Y', $string);
                }
            ));

        $builder->get('dateDeLivraison')
            ->addModelTransformer(new CallbackTransformer(
                function (\DateTime $date = null) {
                    // transform the array to a string
                    return $date === null ? '' : $date->format('d m Y');
                },
                function ($string) {
                    // transform the string back to an array
                    return \DateTime::createFromFormat('d m Y', $string);
                }
            ));


        $builder->add('entite', null, [
                'attr' =>[
                    'class' => 'form-control'
                ],
                'label' => 'client'
            ])
            ->add('objet',null, [
                'attr' => [
                    'class' => 'form-control'
                ]
            ])
            ->add('modeDePaiement',null, [
                'attr' => [
                    'class' => 'form-control'
                ]
            ])
            ->add('conditionsDeReglements',null, [
                'attr' => [
                    'class' => 'form-control'
                ]
            ])
            ->add('dureeDeValidite',null, [
                'attr' => [
                    'class' => 'form-control'
                ]
            ])
            ->add('commentaire',null, [
                'attr' => [
                    'class' => 'form-control'
                ]
            ])
            ->add('tauxDePenalite',null, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Taux de pénalité (%)'
            ])
            ->add('lignes',CollectionType::class, [
                'entry_type' => LigneFactureType::class,
                'entry_options' => ['label' => false],
                'allow_add' => true,
                'attr' => [
                    'class' => 'ligne-widget'
                ]
            ] )

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
            'data_class' => 'AppBundle\Entity\Documents'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_documents';
    }


}
