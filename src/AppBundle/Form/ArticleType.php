<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ArticleType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('reference', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Référence'
            ])
            ->add('designation', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Désignation'
            ])
            ->add('quantite', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Qté'
            ])
            ->add('prixUnitaire', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Prix Unitaire'
            ])
            ->add('referenceFournisseur', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Référence Fournisseur'
            ])
            ->add('taxe', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Tva'
            ])
            ->add('classificationArticle', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Classification article'
            ])
            ->add('classificationVente', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Classification vente'
            ])
            ->add('marge', MargeType::class, [
                'label' => ''
            ])
            ->add('unite', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Unité'
            ])
            ->add('natureArticle', null, [
                'attr' => [
                    'class' => 'form-control person-input'
                ],
                'label' => 'Nature article'
            ]);
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Article'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_article';
    }


}
