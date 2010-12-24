Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PVzT4-0008TZ-Fq
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 05:41:26 +0100
Received: by wyb40 with SMTP id 40so6884705wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 20:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=uBbU7DYDr1Stmq/iPVLJ5JONr2aug0vpzx+QBW5TunA=;
	b=vkJQmJGQ3JpyS+99wPYWMPjuI0oGdeOfYLM8zWhIrl/IowHNdhJUkNwMc+H4iP9Run
	4ecfxFozOwfVn8XUqEw/XoTydNuemSeATxCZ+bh5CqUaGDog9p5qltBoUappSUg1enh/
	DsA1OBHy64Vrqsu2qjRckyQ3dWPiEx8KgoILU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=q+0phXQ//WwKDy6JQZBUSq1EbG062PAFwC0F6W8wnLOgS+I74zjYJwWkTtKyCBKahq
	QUk5nLdb9SpDI3FLeTp2abQpJ4u6oRuWyoim1k11rBhTocPw/jnvrXOyn5sNaa3quP1z
	XsR0xNLpeKaXlR3OAQ7r9Zebx4r7nAr4wgK90=
MIME-Version: 1.0
Received: by 10.227.129.69 with SMTP id n5mr5429073wbs.136.1293165677076; Thu,
	23 Dec 2010 20:41:17 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Thu, 23 Dec 2010 20:41:17 -0800 (PST)
In-Reply-To: <AANLkTin+LDH+6kXJjgWSGzyAc0q8Qie=h337xLH9QDen@mail.gmail.com>
References: <4D13F894.4010100@gmail.com>
	<Pine.LNX.4.64.1012232251340.7526@juice.ott.cti.com>
	<AANLkTin+LDH+6kXJjgWSGzyAc0q8Qie=h337xLH9QDen@mail.gmail.com>
Date: Fri, 24 Dec 2010 15:11:17 +1030
Message-ID: <AANLkTimVUHDNfVMR7o2Pj5xEgZf-JTphHGOaEdGjCmWE@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] micro.conf: Pin an older udev to avoid space consuming dependencies.
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
X-List-Received-Date: Fri, 24 Dec 2010 04:41:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 December 2010 15:10, Graham Gower <graham.gower@gmail.com> wrote:
> On 24 December 2010 14:24, Michael Smith <msmith@cbnco.com> wrote:
>> On Fri, 24 Dec 2010, Graham Gower wrote:
>>
>>> micro-uclibc/micro-image with udev 124 = 957207 bytes.
>>> micro-uclibc/micro-image with udev 162 = 2303604 bytes.
>>
>> Could you be convinced to try udev 141? When I build it, its only
>> runtime dependencies are glibc and libvolume-id.
>
> I'll do some testing with 124.

Miscommunication between brain and keyboard. I meant, i'll test 141.


