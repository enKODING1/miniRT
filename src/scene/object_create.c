#include <stdlib.h>
#include "structures.h"

t_object *object(t_object_type type, void *element)
{
    t_object *obj;

    obj = malloc(sizeof(t_object));
    if (!obj)
        return (NULL);
    obj->type = type;
    obj->element = element;
    obj->next = NULL;
    return (obj);
}

t_sphere *sphere(t_point3 center, double radius)
{
    t_sphere *sp;

    sp = malloc(sizeof(t_sphere));
    if (!sp)
        return (NULL);
    sp->center = center;
    sp->radius = radius;
    sp->radius2 = radius * radius;
    return (sp);
}

void oadd(t_object **list, t_object *new)
{
    t_object *current;

    if (!list || !new)
        return;
    if (*list == NULL)
    {
        *list = new;
        return;
    }
    current = *list;
    while (current->next)
        current = current->next;
    current->next = new;
}