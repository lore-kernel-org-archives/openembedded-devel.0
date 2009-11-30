Received: from mail-px0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NExIW-00057F-3C
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 04:51:39 +0100
Received: by pxi5 with SMTP id 5so2113965pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Nov 2009 19:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=3GqJOZVfZ9QZFjXGErkfza18Lixz6wSiY7n/uPlAw9U=;
	b=CIn4Hs+QQruja+z03Z//jtOdnH0tzoojeZ2U7hvG7JUt8n0TKFxlBFB+ok1cVuguDL
	HKg1h1jb9HuemFVUsp7lAcfiQxmLsXOKL4YNMiRqUU99DbGG9JeMOHT9wAKSlRSMovTv
	Td1YhIRSAYad+EwMYS+iZCcjClZEMX11ZtxOk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZlsVCP0Csi+yUWec35k1keTQjoJddfDhm4Makgw8FnY8yWgzpNHuHBZbkDvukrRlUK
	PamBtxQA031ve8twMMSEP8t5nnuUjpxRw87J6e8A0/B8pa6F0FlpiWrmfhNDb72cS0jO
	ppJlemgGkRi/1OG97MKEOBWx0+fMZVwMFdj7E=
MIME-Version: 1.0
Received: by 10.141.21.12 with SMTP id y12mr214988rvi.248.1259553001765; Sun, 
	29 Nov 2009 19:50:01 -0800 (PST)
In-Reply-To: <20091128221934.GB29288@denix.org>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<ec1f3d400911280005s62b8916dm43a1977b52b2e755@mail.gmail.com>
	<20091128221934.GB29288@denix.org>
Date: Mon, 30 Nov 2009 09:20:01 +0530
Message-ID: <ec1f3d400911291950k18b96a99safae903be1ab5326@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Mon, 30 Nov 2009 03:51:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

you're right...sorry..some problem with my mail client.

--RK

On Sun, Nov 29, 2009 at 3:49 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Sat, Nov 28, 2009 at 01:35:03PM +0530, RK Raggit wrote:
> > Resending mail as this doesnt seem to have reached the mailing list first
> > time around ....
>
> Actually it showed up 3 times...
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

