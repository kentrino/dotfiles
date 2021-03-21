function load-session() {
    echo 'type your AWS MFA code:'
    read MFA
    CREDENTIALS=$(aws sts get-session-token \
        --serial-number arn:aws:iam::305178603704:mfa/kento.haneda \
        --token-code $MFA)
    echo $CREDNETIALS | jq '.Credentials.SessionToken'
}
