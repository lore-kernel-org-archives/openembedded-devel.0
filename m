Return-Path: <trini@konsulko.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 77CA17D8E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 18:51:15 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o25so90416wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=x5QQ2FMnvAE2DvGzRw3QdkOUx9IFyDTJ3qjh5YAiq7c=;
	b=mdD/Kfdz5twXnXoxHrxkaZY7zLYWSbsJEFHaneXC/4NJKznvuJiOd5GujRHKjj5Zba
	U6G6unSI9iU/jTuhgTsPlZ/G4aqs84UPk92ApZB1TxFLd63cb+YYlbMflzayZ1VAvBVs
	OR436zNqMRFwbxKhQ1QlaxBHOSsL1vArjxUKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=x5QQ2FMnvAE2DvGzRw3QdkOUx9IFyDTJ3qjh5YAiq7c=;
	b=FfhVgdFoGP4BeTyGjrE1DwfRsTx7h+4u7cIooxWOe7eP95logGQHsLZ+XRYm1TT4rd
	t/9et2JNfB/NqQzM4q03BZFd0v92AQye8PhdjAOcFuZHKMubz60iaHaY88rPQq9vpcu6
	tJvfrWEu/tVeVVXrpy8sfJ0QAZgA3GWIABgAa3AJWqMrkmTZ6bwG395WPNQYiws5YJ2F
	zeGPYtCgiGtcFg1BnynGQL7Q1JHzIy2GcJ5hiFQrVNgFKFZVBzawXNNR8+a3RfqeJ0Ss
	KBFRqOFOrAQgMeyJVMg5Ub5VNrMjnIqeKgwsYvfYZ6qxnaz0e4l0uKwEcNwdJzpkYgEd
	yXuA==
X-Gm-Message-State: APjAAAWBLPz0rJVyFTZKKCiXVfEkyevKzFIeJPuMVSMm7aTNMNPHnTky
	dk0ZfFMjKjxeMJOyTfEWfqhJpA==
X-Google-Smtp-Source: APXvYqzdkjd+tW//lZkQWz9CkDWX9htU8qQte9GGGlNL/2BhHzeyEqWWo7XzosO8P4wpIZ7B20036Q==
X-Received: by 2002:a05:600c:2302:: with SMTP id
	2mr7864855wmo.115.1556736675868; 
	Wed, 01 May 2019 11:51:15 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	p17sm8342266wrg.92.2019.05.01.11.51.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 11:51:14 -0700 (PDT)
Date: Wed, 1 May 2019 14:51:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190501185110.GD31207@bill-the-cat>
References: <1556733402-22322-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1556733402-22322-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][v3][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Wed, 01 May 2019 18:51:15 -0000
X-Groupsio-MsgNum: 77384
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9youM8miLQ+32LCQ"
Content-Disposition: inline

--9youM8miLQ+32LCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 10:56:42AM -0700, Armin Kuster wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>=20
> [v2]
> bump bitbake to warrior version
>=20
> [v3]
> remove bitbake ref from meta-filesystems

Reviewed-by: Tom Rini <trini@konsulko.com>

That said, the changes which are not just %s#master#warrior# are ones
you'll be pushing to master soon too, yes?  Thanks!

--=20
Tom

--9youM8miLQ+32LCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcyeqdAAoJEIf59jXTHXZSoCMQAIp6xyAW/rYUaKHaaQm3We1b
QYllL7UqiQxkTJ2Csf8eFlc/fNP5xNnh0gdcL97VVXOZHLxf8jQWeFSScAeThy6t
VUywPLqa/ONjVw5v/2J5xlWkUHS2cJszTPNT6nWThxeOFHl05gcm1lqDPs/r1F9i
wnZ5SE9wYN1FuLrIplZCTh2TEUs7vQU9rqUdZ9e+pQeZn0qoDys/hRZyxYnAbv+o
dhbiwo2cf8tomK9f8hmoYDztbWQ4SwBjfY6hMwXe1pTDigpZy/TcoN76lk394pxW
TsXsTS0xi+maY6YGFQB2MoYhMsEHuj593CNsQGoVJBFrNlztydRqkCPot2TdGYI3
QUHyO5XGoHhBbns3F2afsjKRudRmhRDXfjN12iDsfMBsqMIyCZZZ2dMoQy/dHyNV
eVwJI3VllEdRK9aSFiv1BmzBII4nn/VQ+QkZF6gUCvfHhUOgHi+oWNsiS2kJt8dd
4FMnKhdjSQOuU1b/2PaONimfeaCNuS+rZSEvIFlHXYswJtuW9FrVOvWGmGOhsxnI
pUjtg9pg0HLg8QXBZ1cWn0XED0UW7kUo9GYj5IX4NtR8YVMqYUeuYxwAk3MxjucD
CP+Q9DaOJhOJ05SS42HOMBEH51rvp08+gDZZ0cYmNrqrQ0/hqRkpwGaz0VwiXeFP
NGX3hXrKyhSxY7uhZz0P
=7ZU9
-----END PGP SIGNATURE-----

--9youM8miLQ+32LCQ--
