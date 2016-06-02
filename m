Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id AE587771A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 12:01:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n184so14661731wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 05:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=acXJCH8RK15xoUBYEZ0LIsTcmYPrsl4zaIQG/B89Utg=;
	b=YzHImS+EsH2d3NxL0DAN24/CYzsi5nTdq+vpqTHjayhzv8NxTNqBpM5Kjgx0aZRLkE
	7JTTc0/stC0IVei04pzTFVgIH1MEy/2+v7vgLZxrBFuAf52IsQtkJ7awKnsYmqQwv0lt
	Ucj5rl65rZ7vmEi5qTxdWdTFGMdX9LpzaR9O0WxYqX0z9F2LSnTGErFZBUmlqLhbo0uA
	DPkSB30KOPZwpa/QkEF4Sua1wDfwK3us+vsTHW96qWQYUnSVrGRhRhZXom9wdORQXWEY
	pE+HujvWXlYafAR2jp1kHR4F8BNf2Zk/62RtGNtFc5s7Bsu68WaZMXkumoQ0Wdr99Cji
	lMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=acXJCH8RK15xoUBYEZ0LIsTcmYPrsl4zaIQG/B89Utg=;
	b=b1gayNrt9APaBoqvbJ/Xe8LL8n0De+e6SYVQLBnDLe0g3oArp76esDJbtYX7g0pWV0
	THAYi0Xq6ZZl9sIbyarE+CHxnpyBI7yfK/VqH+G6sdfnqTq24p7LUkiiC+t7bawXrGG0
	weYzC4wvRhzmM9YZumSrhA0XAnmOcWIVr5lDEb6V2gQrm4u2dLrEKWWg1nEdQhVP5Mwv
	GIxrU4YqklERzlVZv2f0O52VIMhFJmyVbaHiCsGZAihfaU/y4hvZ4Ef75LT1llQ+ocad
	3CANo+UBiHxul7gzknqpWb38tqttQ0RnULgG6+90DFnAivZ/hMfcjTiXuEd08uEckSuA
	RFqQ==
X-Gm-Message-State: ALyK8tIcsGF7zAQcXMryMapQEkyUgttwuoDYiTyqKssu1aOEdAGcWhBzYCItyWRTloBuHNv87k2uP1sihRQ2xA==
MIME-Version: 1.0
X-Received: by 10.194.75.169 with SMTP id d9mr1130045wjw.167.1464868903527;
	Thu, 02 Jun 2016 05:01:43 -0700 (PDT)
Received: by 10.194.64.101 with HTTP; Thu, 2 Jun 2016 05:01:43 -0700 (PDT)
In-Reply-To: <CAP9ODKoww_v0Sq_E_H0KA2az7ULkmt0Cd9dgSxipMEFYewPufQ@mail.gmail.com>
References: <1464786802-11176-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAP9ODKp+wY9AVGxgS7HfKwgGmrKXadOmLYzL5R104-N5MNu7xg@mail.gmail.com>
	<CAPybu_1SQ0Gw36wB8fiisLZ_zmo0B3gWF85T2M2t2i-X7oe3dg@mail.gmail.com>
	<CAP9ODKoww_v0Sq_E_H0KA2az7ULkmt0Cd9dgSxipMEFYewPufQ@mail.gmail.com>
Date: Thu, 2 Jun 2016 14:01:43 +0200
Message-ID: <CA+chaQcHGO4rFG2366L-ZX0ET56phxiWnTGCPLw_GBsAoFwNrw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] opencv: Reorder PACKAGES variable
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
X-List-Received-Date: Thu, 02 Jun 2016 12:01:43 -0000
Content-Type: text/plain; charset=UTF-8

Please resend both.

On Thu, Jun 2, 2016 at 1:07 PM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Thu, Jun 2, 2016 at 7:08 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
> > Shall i send a v2 with the empty line?
>
> Martin?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

