Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 56D8C79F61
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 15:21:15 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id g26-v6so2069752lja.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2018 08:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4YcGJyzYF5XEChus9p4Ay1IRibFq++yAOqwEkOmmhqo=;
	b=LJezFbegobdUox2e4uW+RDf9TysxApVaRyVl+YEMzE2lb9O7hd3y6jonCEkz7wFR8k
	Ungfdwc2xHKdoHD8lFnPU609/fhAJywhpSVCTQ3DcCztTQDlLOwt4NCfsAjdUfmkzwyt
	qCQcThbQlb23zkpXrwEQajbRCmMQbq8BxcQ4X4v4N2kK/K9GlYwOqbusgNlspQrZwVZY
	Uxh9BEUtn4L3E7pbfw7yRoufL6kSvjjWL/xk8YwUV1TnmBJRXCzouu6k+Ztl3CYCso7Y
	3/2M7vMunyN2YoF2kFxWcwNCVYPy+PY/AajY7gsh3cJikFgtQIjD/58rQqzz5jc3KK2U
	WU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4YcGJyzYF5XEChus9p4Ay1IRibFq++yAOqwEkOmmhqo=;
	b=IbtQkO4pF/25nXd4ZpK7zS1KfUVo8pCU7q2Oyhtu/mbHSFFf5Zn45z70Mk0yo1wZ9U
	EdzkxS/KAt2Bu9mwkYoqz6KZA6AspwUgHYjMANN2l++RMM9X7G3PwkVpXAw9bkk0yo+x
	LBKjTs45NmSMFjRst7nkBlWNDERCipfdXy7Gcf+ShN5SUuYTsDO9nax7TRsZd+nRtqPW
	STA9GwPzmlmEyju5+bfgckBkg5CoPbjuz7y6i78zENs8ozvi/EfRZJrn/3dVuXhU970P
	ke9qjKcFq3MZfW1tzc+85vBeac1I3MCTA+3yzAxuukKVs9bp9J2EiDeQZAdCeoeV2UYV
	uFfA==
X-Gm-Message-State: AGRZ1gJzHzdV7J0WpTue6qSWdA2C2jUK7QaUPnNX6yYCIl3ueaL3fk7k
	r3IiEg8IzjuwOZ99UH3RLndkGCRZbW2Nz1QxCpw=
X-Google-Smtp-Source: AJdET5cf4Bt3wuAOujBYXgD8MAHtSGzEGo1u37/TPl09MJmNnkwX3L+VGnQyu8aHa/PFtjOMX/ikQ+XDxRpgAL9YuSk=
X-Received: by 2002:a2e:8596:: with SMTP id
	b22-v6mr7988823lji.122.1541172075664; 
	Fri, 02 Nov 2018 08:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <1541150188-11814-1-git-send-email-hugues.kamba@arm.com>
In-Reply-To: <1541150188-11814-1-git-send-email-hugues.kamba@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Nov 2018 11:21:04 -0400
Message-ID: <CADkTA4Mw10zbV_dFV+M9c0J=_PXzA-gd8=aA-+=p0zOmMAjjHQ@mail.gmail.com>
To: Hugues.Kamba@arm.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] lvm2: Update source location
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Nov 2018 15:21:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This was already sent yesterday: [oe] [meta-oe][PATCH] lvm2: update SRC_URI

Cheers,

Bruce
On Fri, Nov 2, 2018 at 8:50 AM Hugues Kamba <Hugues.Kamba@arm.com> wrote:
>
> Signed-off-by: Hugues Kamba <hugues.kamba@arm.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index 5728d83..039ed33 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12713b4d938653=
3feeb07d6e4831765a \
>
>  DEPENDS +=3D "util-linux libaio"
>
> -SRC_URI =3D "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
> +SRC_URI =3D "ftp://sources.redhat.com/pub/lvm2/releases/LVM2.${PV}.tgz \
>             file://lvm.conf \
>             file://0001-implement-libc-specific-reopen_stream.patch \
>             file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
> --
> 2.7.4
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

