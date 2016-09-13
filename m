Return-Path: <joaohf@gmail.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5B08A73216
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 21:59:18 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id i129so44925142ywb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ygmRyQ/RNJYXHmBM33UyvZeN5OZGhxoPcxVoz5axlp0=;
	b=OP/k5hGQXWt7BuJgj2wmc6GUTKfg/xogpRomkvmpdb1YB5CZYiWPxq1RuLxVOn5J3x
	tHhnGcVvpOrxyc4g/gFVcrFt7lwyzFBo/E1+gvf9WVZEsen00zXe7uQOmWSjna+8+zJK
	Q9xvSE2ulXxwum1YgrKR2Nmfm7bis8puj23UYaM7cv91TWjcihSRGVMPjdekGx2QPe45
	RKH1JbNkPedT43Cpu/f/zRv6d63AmhwkkGwZhScEpRIkEy9LtjhDWSAGMNcEHwb1OFdo
	uAHfwlozLa0hKBRBN95PlzeVYFcb1fmsDAPZYXFwQGQrXS2I7FbSRVVziqBq0Ww/jzaY
	XPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ygmRyQ/RNJYXHmBM33UyvZeN5OZGhxoPcxVoz5axlp0=;
	b=cvLDVBaEINMLwOmy9raLYEcZVVj8qRsLiaGBdJ5mAmqRrjLBVUG7yu0dLbnUUSxK32
	1VUUmyjlj4V6ZullX1Q1hpp6oVrAlnapEd1YgrHehF40vJaR/uWcm4wEKgPnED5lTsK2
	JLwPayEaHp+znArdoz/QyJLQJlHEmrAwgGIOA7IGvAWkwyvX8l1uoj41OXG9GAHeGaOe
	Ohl+PMX+j+bToTR1Bz8wX8dMAUqrFpXXCrrRoVkzDLyVXqhBP1QtPPnsG9UpneevqRYN
	t9qlGIaJ4HAj0a1st/sUm93jhb9yZLgNIJGz43Jg+EoaeUx0lAlQgc6Mshr8oUEnmBG0
	6/Ng==
X-Gm-Message-State: AE9vXwPdy2/zrCD2QBPHa3fdltyn4NaMfX6VC7gMG0+4hgRn17SqwzlQOt56QkbCyk+cnTCDIp0nnx9jCN8leQ==
X-Received: by 10.129.116.137 with SMTP id p131mr3296825ywc.164.1473803959360; 
	Tue, 13 Sep 2016 14:59:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.3.195 with HTTP; Tue, 13 Sep 2016 14:59:18 -0700 (PDT)
In-Reply-To: <OF1843385E.0DCB6A79-ON85258029.0047BF7F-86258029.00482B78@apcc.com>
References: <OF1843385E.0DCB6A79-ON85258029.0047BF7F-86258029.00482B78@apcc.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
Date: Tue, 13 Sep 2016 18:59:18 -0300
Message-ID: <CANFVK7-vJAdneFHjmCmGbT0-O-n5NrdQHP4W2jiuMP6bVozV-Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-erlang] Update to Erlang 19.0
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
X-List-Received-Date: Tue, 13 Sep 2016 21:59:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Done

Thanks.

On Fri, Sep 9, 2016 at 10:08 AM, <Michael.K.Schmidt@schneider-electric.com>
wrote:

>
> Pull request to add Erlang 19.0
>
> https://github.com/joaohf/meta-erlang/pull/6
>
> Thanks!
> Mike
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

