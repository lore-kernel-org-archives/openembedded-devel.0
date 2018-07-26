Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7501478C31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 19:40:55 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id r184-v6so1006956ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 12:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U8UybPseocOdeYD14v02601sPrY/8QuX8OcnxACE6OU=;
	b=m8JHHNmAcf21QblCE4WkGp9TZPyMGcwCt/syLm2RqGYBcki3QejkfhFihOAu7Xd5yt
	3oB+ZIAH/p1wv0TbasGi7PkYwErh2sao+kh+pLO3zuiH3WKAj2X4UkzFij6hfsxROIUl
	G/1XHou4qiZN/nWLKxLMq/xVXAoqYFLdY3ekTNZUduFjt1/no6NvDRKOnwCzTk1G9VJ5
	gwxb6l9qJC98IZRkgmbnbwnBv+CBnBjOUa6OcqVvUlwalzabPnHWG7/uP8ZdUF7xkVWr
	qcCjy49o6qq+8qijRinLYloM44syyrImjVtC3evk9mKp8FaNhvov+rnayPBTwEGAcwqj
	ioRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=U8UybPseocOdeYD14v02601sPrY/8QuX8OcnxACE6OU=;
	b=GVG5d8ibGL4FE37QeZ+8CKvwKIroy62A61ThDvTqBF7DEx5POap6yixHsAhQToEtat
	hU6gDC7mWFt5TezU3s21hJ8YHinPvGIhATmSJquzoO2pSlbV89FOmSGnrNScip6t6yot
	cFvR44xHLDfKG8U/qmn8YuX8YjYquULtvHP/4Ka/n27z75HxZW1LAGtXkqqhTfWBrGhI
	csVmqmQHIZY08p0bvQjMVw5ZBZB+fBaQBtXgW+pZoTjVun59ZT+I/Z+w86XkUxILJokt
	31nR6Cda/Fwzdp3CjgUf8J3w1gBDWPLe5k3UG7Zozp7lirJGYtfU9YKvx+otK9R/8rvY
	wB8A==
X-Gm-Message-State: AOUpUlHp/HbSelXWkGbYBDvPC4jArI9cU3i9O9rzdQ+EFDefzqxKPL8y
	rT/SpkxtSCQibBuCuGafPkgVoBKtR0DOLjekp58=
X-Google-Smtp-Source: AAOMgpcUhZe0Y12oWYcDEkbig2CwQyWIFFU3qlHDBbFFKyFXKfz6Ra6cL3h9FsK5zqA0+T5YgaVfwv5OGCFyfn4AA9k=
X-Received: by 2002:a0d:c342:: with SMTP id
	f63-v6mr1741884ywd.508.1532634056343; 
	Thu, 26 Jul 2018 12:40:56 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 2002:a5b:612:0:0:0:0:0 with HTTP;
	Thu, 26 Jul 2018 12:40:55 -0700 (PDT)
In-Reply-To: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 26 Jul 2018 15:40:55 -0400
X-Google-Sender-Auth: UWzRVFG4ZdlnncFzfogsVHmxEsI
Message-ID: <CAPuovEKX5w=1ObAgOw71UteCmh74Qf9KQ44_L4NbmLniwX4Jyg@mail.gmail.com>
To: William Delacre <williamdelacre@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: (No subject)
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
X-List-Received-Date: Thu, 26 Jul 2018 19:40:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2018 at 8:28 AM, William Delacre
<williamdelacre@gmail.com> wrote:
> Hi ! :-)
>
> I=E2=80=99m facing issues when trying to run =E2=80=98bitbake python-twis=
ted=E2=80=99 (do_compile
> error)
>
> Log says :
> =E2=80=9CDownload error on https://pypi.python.org/simple/incremental/: [=
Errno -3]
> Temporary failure in name resolution
>
> ............
>
> distutils.errors.DistutilsError : Could not find suitable distribution fo=
r
> Requirement.parse(=E2=80=98incremental>=3D16.10.1=E2=80=99)=E2=80=9D
>
> First of all I=E2=80=99m not connected to internet, so I=E2=80=99ve pre-d=
ownloaded all the
> required packages (twisted-17.9.0.tar.bz2 & incremental-17.5.0.tar.gz are
> present in my build/downloads folder)
>
> It=E2=80=99s the first time I have some =E2=80=9Cdownloading issues=E2=80=
=9D and I=E2=80=99m stuck on it
> for a few hours now..
>
> Any tips for me ?

Check all aspects of what you have manually downloaded and populated
in your downloads. My guess is that a checksum or some other detail
isn't matching and it is rejecting what you have and thus attempting
to re-download the file.

Mark

>
> Thanks in advance !
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

