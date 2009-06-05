Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MCXfd-0003Pk-1O
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 13:33:13 +0200
Received: by fxm20 with SMTP id 20so1433349fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2009 04:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=S+iKoIuGXjAjs0B8HY6sFa2b2VUuIwROj8npYk5hWnU=;
	b=v5aymJBDDvWdudOEu4wdnlqmnED8lSrQkGJYtfIQ2K+o6zIBWATzehZS3QzGwOXn4h
	IAwoartgC4OJ4bEajYfY37o+0nnJ8PFPjAFmytFVmhaCiNxRJICdy+6QZ2F8clabIx7g
	OB5KtmRTuYXczA0PZL/FzZYU1vDERSVcCtd4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ik5tA5+Tn3jQMd0WJjsycFZRS9z9lvqOcYSYRvkovwvLMQMMCLnCgJU3fEijYwDdLq
	0xIWnU3p4rRw5+7sdDBIF8N+U7pBDiKNg2+n+oJgCcQ8R6VQmbWnLZKDte9pQIFay/j1
	Kr4OEZGXmFXlyCpRGjuvBGKHJ6IWykM5DqwmQ=
MIME-Version: 1.0
Received: by 10.103.226.10 with SMTP id d10mr2092929mur.105.1244200569363; 
	Fri, 05 Jun 2009 04:16:09 -0700 (PDT)
In-Reply-To: <974C3B6C9F0A4A43918BACCA33390AC270D44F3462@mail.microsol.ie>
References: <974C3B6C9F0A4A43918BACCA33390AC270D44F3462@mail.microsol.ie>
Date: Fri, 5 Jun 2009 14:16:09 +0300
Message-ID: <fce2a370906050416w5c991945t34de328e2442090a@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: add log4cxx checksum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jun 2009 11:33:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Do you know that your 'confidencial message' is put to the public
list? Please don't send this footer crap to the mailing list.
For sending patches, there is a nice 'git send-email' tool.

On Fri, Jun 5, 2009 at 2:05 PM, Lucian Ion<luciani@microsol.ie> wrote:
> Sorry for the empty message,
> I did attach the patch but I don't know why it is not in the final email.
> Should I paste the patch in the text. Does this help?
> How do I send this patch?
>
> From b2aff377af0df1e3820f25b45af3bf6216aecc76 Mon Sep 17 00:00:00 2001
> From: Lucian Ion <luciani@luciani-laptop.(none)>
> Date: Fri, 5 Jun 2009 11:41:05 +0100
> Subject: [PATCH] add log4cxx checksum from apache
>
> ---
> =C2=A0conf/checksums.ini | =C2=A0 =C2=A04 ++++
> =C2=A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 2cca3f8..085fac0 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -15506,6 +15506,10 @@ sha256=3D138b70379317b4d2962694879c26f7579f77712=
56bd67d462012bed17f1fcba5
> =C2=A0md5=3D9b9b6da3612b629f40b97d295c8854f0
> =C2=A0sha256=3Daeab92eb4f81b3ae12a1d4e3d8d9b3650cc0f37ce7f9d1562c29364567=
d87acb
>
> +[http://archive.apache.org/dist/logging/log4cxx/log4cxx-0.9.7.tar.gz]
> +md5=3Dfd09abc90b8c0c8af1d5146a75590792
> +sha256=3D5b41b2fc267595bdb0fa4cd1152309413bc70e6d9196293113ebb82751eb7ec=
6
> +
> =C2=A0[ftp://ftp.logilab.fr/pub/common/logilab-common-0.37.1.tar.gz]
> =C2=A0md5=3D39561a45c74f8ff11e2ddd872f4ee5bc
> =C2=A0sha256=3Dc5974c1e98bed62bb3153a8144069c43229c6b208ef599bc77c84fb493=
c2291b
> --
> 1.6.0.4
>
>
>
>
> Regards,
> Lucian Ion
> Software Engineer
> Microsol Ltd.
> Tel: =C2=A0 +353-1-4153716
> Fax: =C2=A0+353-1-6716343
> ________________________________________
> From: openembedded-commits-bounces@lists.openembedded.org [openembedded-c=
ommits-bounces@lists.openembedded.org] On Behalf Of Lucian Ion [luciani@mic=
rosol.ie]
> Sent: 05 June 2009 11:56
> To: openembedded-commits@lists.openembedded.org
> Subject: [oe-commits] add log4cxx checksum
>
> Regards,
> Lucian Ion
> Software Engineer
> Microsol Ltd.
> Tel: =C2=A0 +353-1-4153716
> Fax: =C2=A0+353-1-6716343
>
> _______________________________________________________________________
>
> This email and any files transmitted with it are confidential and intende=
d solely for the use of the individual or entity to which they are addresse=
d.
>
> If you have received this email in error please notify the originator of =
the message.
> This footer also confirms that this email message has been scanned for th=
e presence of computer viruses.
>
> Any views expressed in this message are those of the individual sender, e=
xcept where the sender specifies and with authority, states them to be the =
views of Microsol.
>
> If you have received this mail in error you are requested to e-mail us (i=
nfo@microsol.ie) or by telephoning Microsol on +353 14153700.
>
> Please Visit our website at
> http://www.microsol.com
>
> _______________________________________________________________________
>
> This email has been scanned for all viruses.
> _______________________________________________________________________
>
> ________________________________________________________________________
> This email has been scanned for all viruses.
> ________________________________________________________________________
>
> _______________________________________________________________________
>
> This email and any files transmitted with it are confidential and intende=
d solely for the use of the individual or entity to which they are addresse=
d.
>
> If you have received this email in error please notify the originator of =
the message.
> This footer also confirms that this email message has been scanned for th=
e presence of computer viruses.
>
> Any views expressed in this message are those of the individual sender, e=
xcept where the sender specifies and with authority, states them to be the =
views of Microsol.
>
> If you have received this mail in error you are requested to e-mail us (i=
nfo@microsol.ie) or by telephoning Microsol on +353 14153700.
>
> Please Visit our website at
> http://www.microsol.com
>
> _______________________________________________________________________
>
> This email has been scanned for all viruses.
> _______________________________________________________________________
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


