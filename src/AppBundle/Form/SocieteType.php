<?php

namespace AppBundle\Form;

use AppBundle\Entity\AdresseSociete;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SocieteType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('raisonSociale')
            ->add('permalien')
            ->add('capitalSocial')
            ->add('dateDeCreation', DateType::class)
            ->add('activitePrincipale')
            ->add('systemeComptable')
            ->add('formeJuridique')
            ->add('secteurActivite')
            ->add('pays')
            ->add('adresseSocietes', CollectionType::class, [
                'label' => ' ',
                'entry_type' => AdresseSocieteType::class,
                'entry_options' => ['label' => false],
                'allow_add' => true
            ])
            ->add('monnaie');
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Societe'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_societe';
    }


}
