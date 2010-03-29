Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bmentink@gmail.com>) id 1NwNfc-0002QL-6F
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 00:42:57 +0200
Received: by pwj5 with SMTP id 5so3411232pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 15:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=9wWvXyFaKWyU5jaXIPhiKVRw0FXeFngLbkIcVrJ0iqg=;
	b=QF2JzyHZUCfkiqYxGGevfG8wVXh8aOAD3bpyWXQnh6eXzWvFhpm3JJaPHYtrTAdXje
	S/WnIgsnGyc4JRjNTQOWOCyr8Th0B+jeNNajU8WEeC7PGKH8Lqdi21UkEwNWK8uRvJTF
	12DwRN6hpwGCySlHsOwevcuJqC8W4UtGhR5FY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YbN2Dnp9SM0r8vEERyWK2NHW+BbZJg1pj5qIkZLbkZXiIna+gkdIOumGb4nW4AZSDE
	TCV6/bZKqMt6Gh3LeyFRJeAm94vqQfSBlA8WsIIrqLRnB7U0B8kDO4gcD27TrpnGmlGO
	ZHeDhTD/2hzDhm7goj/AMvBWCjQbd6f2x4zgQ=
MIME-Version: 1.0
Received: by 10.142.157.6 with HTTP; Mon, 29 Mar 2010 15:39:41 -0700 (PDT)
In-Reply-To: <e2e2e5501003291233q2548ddbaif8d590b2637c1fc6@mail.gmail.com>
References: <a25fc1971003291229o686565d7if29755e2b4bbe482@mail.gmail.com>
	<e2e2e5501003291233q2548ddbaif8d590b2637c1fc6@mail.gmail.com>
Date: Tue, 30 Mar 2010 11:39:41 +1300
Received: by 10.142.208.11 with SMTP id f11mr785907wfg.125.1269902381085; Mon, 
	29 Mar 2010 15:39:41 -0700 (PDT)
Message-ID: <a25fc1971003291539o5ac5791ay9d9888d02518880e@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: bmentink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Porting OE to new hardware
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
X-List-Received-Date: Mon, 29 Mar 2010 22:42:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks, but doesn't help at all .... I think it requires a level of
understanding I don't have yet ...

Cheers,
Bernie

On Tue, Mar 30, 2010 at 8:33 AM, Izak Burger <isburger@gmail.com> wrote:

> Hi Bernard,
>
> I found this page during my searches for similar info:
>
> http://wiki.openembedded.net/index.php/Adding_a_new_Machine
>
> Don't know how useful or up to date it is though, I'm still new to
> these parts and to OE in general, but I thought I'd post that here in
> case it is useful.
>
> regards,
> Izak
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
You always have believers and scepticts.. A True inventor is always a
believer..

