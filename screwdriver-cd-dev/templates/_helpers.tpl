{{- define "scm_settings" -}}
{
    {{ .Values.api.gheHost | default "github.com" | quote }}: {
        "plugin": "github",
        "config": {
            {{ if (.Values.api.gheHost) }}
            "gheHost": {{ .Values.api.gheHost | quote }},
            {{ end }}
            "secret": {{ .Values.api.secret | default "SUPER-SECRET-SIGNING-THING" | quote }},
            "oauthClientSecret": {{ .Values.api.oauthClientSecret | default "REPlACE_ME" | quote }},
            "oauthClientId": {{ .Values.api.oauthClientId | default "REPlACE_ME" | quote }},
            "username": {{ .Values.api.username | default "sd-buildbot" | quote }},
            "email": {{ .Values.api.email | default "dev-null@screwdriver.cd" | quote }}
        }
    }
}
{{- end -}}

{{- define "jwt_private" }}
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAzveGPH/kY1CMtM2GoEkDcjQvRhet3md2soNIhbzO4WvJag/p
T9wd4qQMSlcN5bluTxpsst+4+P3PsQVweGPblBwHNa3C9JMNVc31k2gBNHLFPRlc
LjGY6jZ9dIiT5LJ0xTkU+IDySMX+pn56+NrtPdIF83CCfYo5A3AHFNP4jd6vIqfU
nEALwXs7oh2RJGZF5jd2LEZxtFiOsOwK89wqHlNpqkK9NcXcipWxMbumF2rvsq3F
J9MvTcarpAT3u1v7wWIoxF56WMH6nVoPOoCa4CtF7ui5AYIWFtXCxW1IaEAKI0sw
d6wJf7n7SXPk6kGlrRT/Jyj9CXUU2HHEkgH8BwIDAQABAoIBACV4SLRBTz7vwVmm
b/4q2dXePsTI2rCOOL4e6I1V3nqPQhrSoKHVrw9uNc9rrVdu19q4ZP+JY3qosOZS
nscdBQ7ueBuuxsHysZJcRF6YkMdHFBB4u+idEBsvHE1xwJzB9kQSjopjBfpI5k6M
TYUqVZNAp9UoBGfoE2Rc7ttFeRVt7LW+ZvHSkXZnJPhlnpJkpaaAkTucMYLsMObZ
VC2kfZx20/j9EGinsGgehez5G6g/tU3l8B0teYsjEZ4QaCVRbK1wSETOXqjMDqd6
2Du5JgX5yqIGIl7+VkFifbOuLDKBP/SRF/akDe5PFuTsSa+HFo20PPmmBUI88+nN
uZhD5nkCgYEA/eabP3IMun8YLDOKAsrwuH6CEnul1fllYYgfVINeIF21JWeNZzz7
ysb8l1HwHx2icvpmaAX5orLaHHMqzi8moLWI26lUgJYcXQ02lFP16DiwRxQwyhzE
FhD6Gg4+nGOdlSxr/fEY19ua6u1NzY8+oXTSMlC1cWS2v6W/R8NmWxMCgYEA0K2U
ebcaSHT4QC6iQAGpVX+RJbg8Cidw1tUqdcbNwZTaPRntxS5RQ4BCuyqIpkDYyWjf
pbuyLc7uRObNeJY1GMoFaLMSW9HoRpmUAWS7YQH5dhZyMNlKpioiBEfaP1ivb41+
Sa66RwPgH0TMsD9bLK3rchHUKkPiS/2FIER9Jb0CgYAYpbxIam/l4tSb5dzt7Hl1
z4Ic/TfaD73Ru/8emyoWBkLBgM3vSbI/uxVmMyQWQTA17SznyDy1mJsny95J6bXc
QAMrH8L+QJQ8TD4SJBxpEKe8Hq+lzykR41AEG4HkeJ8hjhBltHPu8HiXebXl0JQJ
5GdLTx5uBZLgA90PwF49VQKBgGJ+m4b7kq9Cbm401KYrYpaVWJgaJlSQmyT7hkgC
5tkI/h064Mxh+T9ICbc38zmtf+VI187tEcOnWTUyTycslrE1oWnyo6atI9o24PHr
brnx6aIAJDPETASz/ExS8cNWg6++dC4pB4k/XgjEO2yw6sLi8C9uFNtCIUzGw5Ag
Y4VtAoGBAKmDY5YuaHiV8MbkNNKFCoc5k2aZFbOan/Hh+lkt57R9xNEZ0NAj37sx
J8Ta4lSjUfNq70BmaC+iPHjYbamXvBaybjYYjvrcxdKDV2tUNMpXF0gQGNiTfgwu
Mwhr9as3T3C+MCrRvdPK3S8SYU8LQZ/eO/oOVH4FE3es9DgXo6Sk
-----END RSA PRIVATE KEY-----
{{- end -}}

{{- define "jwt_public" }}
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzveGPH/kY1CMtM2GoEkD
cjQvRhet3md2soNIhbzO4WvJag/pT9wd4qQMSlcN5bluTxpsst+4+P3PsQVweGPb
lBwHNa3C9JMNVc31k2gBNHLFPRlcLjGY6jZ9dIiT5LJ0xTkU+IDySMX+pn56+Nrt
PdIF83CCfYo5A3AHFNP4jd6vIqfUnEALwXs7oh2RJGZF5jd2LEZxtFiOsOwK89wq
HlNpqkK9NcXcipWxMbumF2rvsq3FJ9MvTcarpAT3u1v7wWIoxF56WMH6nVoPOoCa
4CtF7ui5AYIWFtXCxW1IaEAKI0swd6wJf7n7SXPk6kGlrRT/Jyj9CXUU2HHEkgH8
BwIDAQAB
-----END PUBLIC KEY-----
{{- end -}}

{{- define "ecosystem_api" -}}
{{ .Values.common.ecosystemAPI }}:{{ .Values.api.nodePort }}
{{- end -}}

{{- define "ecosystem_ui" -}}
{{ .Values.common.ecosystemUI }}:{{ .Values.ui.nodePort }}
{{- end -}}

{{- define "ecosystem_store" -}}
{{ .Values.common.ecosystemStore }}:{{ .Values.store.nodePort }}
{{- end -}}