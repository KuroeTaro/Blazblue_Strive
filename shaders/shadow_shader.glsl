extern vec2 direction;
extern number steps;
extern number shadowAlpha;

vec4 effect(vec4 color, Image texture, vec2 texCoord, vec2 screenCoord) {
    vec4 sum = vec4(0.0);
    for (int i = 1; i < int(steps); i++) {
        vec2 offset = direction * float(i) * 1;
        vec4 sample = Texel(texture, texCoord + offset);
        sum += vec4(0.0, 0.0, 0.0, sample.a * shadowAlpha * (1.0 - (float(i) / float(steps))));
    }
    return sum * color;
}