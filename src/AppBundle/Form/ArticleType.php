<?php

namespace AppBundle\Form;

use AppBundle\Entity\Tva;
use function PHPSTORM_META\type;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
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
            ->add('designation', null, [
                'attr' => [
                    'class' => 'form-control widen '
                ],
                'label' => 'Désignation'
            ])
            ->add('quantite', null, [
                'attr' => [
                    'class' => 'form-control little-form-control'
                ],
                'label' => 'Qté'
            ])
            ->add('prixUnitaire', null, [
                'attr' => [
                    'class' => 'form-control catalogue-puht-vente'
                ],
                'label' => 'Prix Unitaire'
            ])
            ->add('fournisseurs', null, [
                'attr' => [
                    'class' => 'form-control '
                ],
                'label' => ' Fournisseur'
            ])
            ->add('tva', null, [
                'attr' => [
                    'class' => 'form-control little-form-control catalogue-tva'
                ],
                'label' => 'Tva'
            ])
            ->add('classificationArticle', null, [
                'attr' => [
                    'class' => 'form-control '
                ],
                'label' => 'Classification article'
            ])
            ->add('classificationVente', null, [
                'attr' => [
                    'class' => 'form-control '
                ],
                'label' => 'Classification vente'
            ])
            ->add('marge', MargeType::class, [
                'label' => ' ',
                'attr' => [
                    'class' => 'row marge-type-row'
                ]
            ])
            ->add('unite', null, [
                'attr' => [
                    'class' => 'form-control little-form-control'
                ],
                'label' => 'Unité'
            ])
            ->add('natureArticle', null, [
                'attr' => [
                    'class' => 'form-control '
                ],
                'label' => 'Nature article'
            ])
            ->add('submit', SubmitType::class, [
                 'attr' => [
                    'class' => 'btn btn-primary'
                 ],
                 'label' => 'Enregistrer'
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
