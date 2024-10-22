$(document).ready(function () {
    var urlParams = new URLSearchParams(window.location.search);
    var pokemonId = urlParams.get('pid') || 1; 

    getPokemonDetails(pokemonId);

    function getPokemonDetails(pokemonId) {
        $.ajax({
            url: `https://pokeapi.co/api/v2/pokemon/${pokemonId}`, 
            method: "GET",
        }).done(function (pokemonDetail) {
            $("#PokemonDetail").html("");

            var types = pokemonDetail.types.map(function (type) {
                return `<span class="${type.type.name}-box me-2 fs-6">${type.type.name.toUpperCase()}</span>`;
            }).join("");


            getSpeciesData(pokemonDetail.species);

            getWeaknesses(pokemonDetail.types);


            var template = `
                <div class="container mt-5">
                    <div class="row align-items-center">
                        <div class="row justify-content-between align-items-center mb-4">
                            <div class="col-md-3 text-start">
                                <a href="?pid=${parseInt(pokemonId) - 1}" class="btn btn-outline-light btn-lg d-flex align-items-center justify-content-start">
                                    <i class="bi bi-arrow-left-circle"></i>
                                    <span class="ms-2">N.º ${parseInt(pokemonId) - 1} </span>
                                </a>
                            </div>

                            <div class="col-md-3 text-end">
                                <a href="?pid=${parseInt(pokemonId) + 1}" class="btn btn-outline-light btn-lg d-flex align-items-center justify-content-end">
                                    <span class="me-2">N.º ${parseInt(pokemonId) + 1} </span>
                                    <i class="bi bi-arrow-right-circle"></i>
                                </a>
                            </div>
                        </div>
                        
                        <div class="col-md-8 mx-auto">
                            <h1 class="mb-3 text-center">${pokemonDetail.name.charAt(0).toUpperCase() + pokemonDetail.name.slice(1)} <small>N.º ${pokemonDetail.id}</small></h1>
                            <div class="d-flex align-items-center">
                                <div class="pkm-card col-md-4 me-auto">
                                    <img src="${pokemonDetail.sprites.front_default}" alt="${pokemonDetail.name}" class="pkm-img" style="max-width: 100%;">
                                </div>
                                <div class="col-md-8">
                                    <p>La llama que tiene en la punta de la cola arde según sus sentimientos. Llamea levemente cuando está alegre y arde vigorosamente cuando está enfadado.</p>
                                    <div class="pokemon-details p-3">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <ul class="list-unstyled">
                                                    <li><strong>Altura:</strong> ${pokemonDetail.height}</li>
                                                    <li><strong>Peso:</strong> ${pokemonDetail.weight}</li>
                                                    <li><strong>Categoría:</strong> </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6">
                                                <ul class="list-unstyled">
                                                    <li><strong>Sexo:</strong> </li>
                                                    <li><strong>Habilidad:</strong> ${pokemonDetail.abilities[0].ability.name}</li>
                                                    <li id="eggType"><strong>Grupo huevo: </strong> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mt-5">
                                            <h5>Tipo</h5>
                                            ${types}
                                        </div>

                                        <div class="col-md-6 mt-5">
                                             <h5>Debilidades</h5>
                                            <div id="weaknesses" class="mx-auto"> </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            
            $("#PokemonDetail").append(template); 
        });
    }

    function getSpeciesData(pokemonSpecies) {
        $.ajax({
            url: pokemonSpecies.url,
            method: "GET",
        }).done(function (speciesDetail) {
            var eggGroups = speciesDetail.egg_groups.map(function (group) {
                return group.name.charAt(0).toUpperCase() + group.name.slice(1);
            }).join(", ");

            $("#eggType").text(` ${eggGroups}`);
        });
    }

    function getWeaknesses(types) {
        var weaknesses = [];

        types.forEach(function (typeInfo) {
            $.ajax({
                url: typeInfo.type.url,
                method: "GET",
            }).done(function (typeDetail) {
                var typeWeaknesses = typeDetail.damage_relations.double_damage_from.map(function (weakType) {
                    return `<span class="${weakType.name}-box me-2 fs-6">${weakType.name.toUpperCase()}</span>`;
                }).join("");

                weaknesses.push(typeWeaknesses);
                $("#weaknesses").html(weaknesses.join(""));
            });
        });
    }
});
