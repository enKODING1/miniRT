#include <stdlib.h>
#include "structures.h"

t_object *object(t_object_type type, void *element, t_color3 albedo)
{
    t_object *obj;

    obj = malloc(sizeof(t_object));
    if (!obj)
        return (NULL);
    obj->type = type;
    obj->element = element;
    obj->next = NULL;
    obj->albedo = albedo;
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

t_light *light_point(t_point3 light_origin, t_color3 light_color, double bright_ratio)
{
    t_light *light;

    if (!(light = (t_light *)malloc(sizeof(t_light))))
        return (NULL);
    light->origin = light_origin;
    light->light_color = light_color;
    light->bright_ratio = bright_ratio;
    return (light);
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