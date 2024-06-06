nextflow.enable.dsl=2

process reverseText {
    publishDir 'output', mode: 'copy'

    input:
    path file

    output:
    path "${file.simpleName}.reverse"

    script:
    """
    rev $file > ${file.simpleName}.reverse
    """

}

workflow {
    params.input_files = params.input_files ?: 'data/*.txt'
    
    input_files = Channel
        .fromPath(params.input_files)

    input_files
        | reverseText
}
