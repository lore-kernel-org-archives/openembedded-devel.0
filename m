Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id F385C60290
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 01:53:16 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v77so693455wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 17:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hNwQolZW4txJ3/9k0Z1w+r5RyU6CKNFJV0jRh2f41r8=;
	b=h5zd681iRxqKSG1l1nqQLSh8o7bLxxIkB+Zt2l2h0KFVaPdZG7EXvTur7S7QqE29kT
	jMAaDStocqv9H6zk8tnbxa6ZC1KXIjXvzPOLSBZ8BJtXc4XYY31+gYDVqBxn1whn+X2T
	aLPcCzg7QWKO0ETEuqjYLpHVcBpVi0zu7wbm4iY4HS48Bn1pO27fKnKiKWvTXWW+sBZh
	1qt9FFCH4Je5eur8xA7tJwfG1daNepOwSu9ZuE6XInNrxH9H1qDHM2YP5PGNpv1pwWA3
	IXmG7JqexDur8G1UqmHDjnM26vW6bhvJ1lrSfv0lA6+QPbhkBjtyrFcDMPnC7WaJLESy
	qJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hNwQolZW4txJ3/9k0Z1w+r5RyU6CKNFJV0jRh2f41r8=;
	b=Zrn3acHpp/AlONKUjIr8izoMUNyMuD9lFSZArkMYEqEhP+D7KCGYnj2PZeHKoQTqbp
	rbv4y6/zr12RGyiHBbqmcuOv3eqiy8hRVK55wepdOOa3G9YYOJj+nZrbtjbtVSpN7l0y
	rhvpZmOFBJMgXX/V2/ykG2vYnPPn7IQGq844cktxknuizyskFEzZl9s49oauMidizjKt
	f8r9B8d4jXvFxQly7qREUbC+Y7nny5j4wJuwPrydJa14Ek4X8UDAiYSP+ZcX9UWtY9za
	4+JRHYalSgwZnQtKUjMm4BxlWaxHp9bHQX4FNzW2YdG3e0mvWqkQcuIuIBQ2dmt8pSpu
	shJQ==
X-Gm-Message-State: AMke39mO3/5HnA153NAR3R0iSMdH/z5Iw2dElr1BFPJGqozhEUUsw9lK9SrGsvxqWpQZVw==
X-Received: by 10.28.51.205 with SMTP id z196mr1265470wmz.22.1487814797434;
	Wed, 22 Feb 2017 17:53:17 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q1sm4241449wmd.6.2017.02.22.17.53.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Feb 2017 17:53:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Feb 2017 02:53:17 +0100
To: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <20170223015317.GJ3283@jama>
References: <20170222213254.GH3283@jama>
	<506a5e6c-36f6-7b1f-a375-24bebb57342f@linuxfoundation.org>
	<CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Before you ping some older patches
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
X-List-Received-Date: Thu, 23 Feb 2017 01:53:17 -0000
X-Groupsio-MsgNum: 65502
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XjbSsFHOHxvQpKib"
Content-Disposition: inline

--XjbSsFHOHxvQpKib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 12:48:22AM +0100, Martin Jansa wrote:
> Hi Michael,
>=20
> thanks for quick fix.
>=20
> The hook now shows error about sendmail I wasn't seeing before:
>=20
> OE @ ~/meta-openembedded $ git push origin master-next
> Counting objects: 78, done.
> Delta compression using up to 8 threads.
> Compressing objects: 100% (25/25), done.
> Writing objects: 100% (78/78), 7.35 KiB | 0 bytes/s, done.
> Total 78 (delta 56), reused 66 (delta 49)
> remote: No sendmail executable found.  Try setting
> multimailhook.sendmailCommand.
> To git.openembedded.org:meta-openembedded
>    eb7979113..0d27137f0  master-next -> master-next

Now it found some sendmail...=20

OE @ ~/meta-openembedded $ git push origin master-next=20
Counting objects: 85, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (71/71), done.
Writing objects: 100% (85/85), 18.90 KiB | 0 bytes/s, done.
Total 85 (delta 47), reused 0 (delta 0)
remote: Sending notification emails to: openembedded-commits@lists.openembe=
dded.org.
remote:=20
remote: Exception 'CommandError' raised. Please report this as a bug to
remote: https://github.com/git-multimail/git-multimail/issues
remote: with the information below:
remote:=20
remote: git-multimail version 1.2.0
remote: Python version 2.7.12 (default, Nov 19 2016, 06:48:10)=20
remote: [GCC 5.4.0 20160609]
remote: Traceback (most recent call last):
remote:   File "/home/git/bin/git_multimail.py", line 3729, in main
remote:     run_as_post_receive_hook(environment, mailer)
remote:   File "/home/git/bin/git_multimail.py", line 3386, in run_as_post_=
receive_hook
remote:     push.send_emails(mailer, body_filter=3Denvironment.filter_body)
remote:   File "/home/git/bin/git_multimail.py", line 3332, in send_emails
remote:     change.recipients,
remote:   File "/home/git/bin/git_multimail.py", line 1883, in send
remote:     raise CommandError(self.command, retcode)
remote: CommandError: Command "/usr/sbin/sendmail -oi -t" failed with retco=
de 1
To git.openembedded.org:meta-openembedded
   0d27137f0..57115ebc1  master-next -> master-next


> On Thu, Feb 23, 2017 at 12:06 AM, Michael Halstead <
> mhalstead@linuxfoundation.org> wrote:
>=20
> > The hooks are repaired and need testing. (Bad git/config settings.) Ple=
ase
> > feel free to resubmit patches. Let me know if they do not appear in
> > patchwork.
> > I'm trying to see if I can automatically resend the missed patches and
> > mark them superseded if needed. I'll update post here if it works.
> >
> >
> >
> > On 02/22/2017 01:32 PM, Martin Jansa wrote:
> >
> > 1) Make sure they aren't already in master (or master-next), currently
> > there is only one change in master-next:
> > eb7979113 netcat-openbsd: fix implicit dependency on pkg-config
> >
> > 2) Make sure there weren't some negative feedback comments on our change
> >
> > 3) Make sure the change made it to patchwork, currently there is only
> > one "open" change:https://patchwork.openembedded.org/patch/137499/
> >
> > Be aware that the changes are usually daily marked as archived, when
> > they are sorted to corresponding bundles and included in master-next
> > branch for testing, as described here:http://www.openembedded.org/wiki/=
Patchwork#Multiple_layers_sharing_the_same_oe_project_on_patchwork
> >
> > I'm writing this, because currently many changes are missing on patchwo=
rk,
> > because of some unknown issue with it, see:http://lists.openembedded.or=
g/pipermail/openembedded-devel/2017-February/111467.html
> > once this issue is resolved, please re-send missing changes.
> >
> > Regards,
> >
> >
> >
> >
> > --
> > Michael Halstead
> > Linux Foundation / SysAdmin
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XjbSsFHOHxvQpKib
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK5AjAAKCRA3VSO3ZXaA
HJIcAJ9cLVgPpmw+WV/9IjAvh5GIefQZNQCglrdq8hOHn6NvHKrBaXliPWpsxDE=
=WR04
-----END PGP SIGNATURE-----

--XjbSsFHOHxvQpKib--
