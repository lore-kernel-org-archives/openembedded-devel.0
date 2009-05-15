Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M4wXj-00083u-O0
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 14:29:39 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1071839ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 05:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SIHSGJPhQaRb/31f0KsNLHYSDFJbRbwURMzsTO7Rqa0=;
	b=Cu/fskW6fQ0006A5Q2LHSW/SCm3D75J0D2OQ1CGZn3p38/LPUiPjbqjbWzK6ejG5Av
	VfvU/XJ9w8t5oMQr+ODBlbJEWtSQ4zCjV+9PGZfXirVIuBRUgiZRKZHjqrXaZDLnepWB
	/95B6d+j/g0LcCCNxFqPz5JmBTu5EsxPuKZHg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Eua9i+5WYq0CzGK/sneZbI+UoGuaspcW22BkmdrFuYvyT2UN1ZzotaisZZ0i6m6zT6
	DLUI9bjDByaopTVfx3QJHw97SI3KzBHC0siEh/OneK0hos28lrNUJjzOOVbH0NI/vkK2
	YwVC20zHZbLlcU5j1d5LYPZk4hIfhB4X8V8Lo=
MIME-Version: 1.0
Received: by 10.151.74.6 with SMTP id b6mr5887079ybl.1.1242390163102; Fri, 15 
	May 2009 05:22:43 -0700 (PDT)
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF7D7@hiob.intern.dresearch.de>
References: <f96d234e0905131216o2111c9d8medac9b4450d5aaa@mail.gmail.com>
	<4A0B21AB.70602@balister.org>
	<f96d234e0905141437g211d48ffgc598c0f9e69beabe@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF7D6@hiob.intern.dresearch.de>
	<4A0D5434.9070308@balister.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF7D7@hiob.intern.dresearch.de>
Date: Fri, 15 May 2009 08:22:43 -0400
Message-ID: <f96d234e0905150522j4b768ae6kecb0213d8e9429b4@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE git move to OSUOSL
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
X-List-Received-Date: Fri, 15 May 2009 12:29:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Fri, May 15, 2009 at 7:58 AM, Sledz, Steffen <sledz@dresearch.de> wrote:
>> > In the OE wiki there are also some references to
>> > openembedded.net. Should they all changed to openembedded.org?
>>
>> Yes, we need to start changing all the .net stuff to .org. Any help
>> would be great.
>
> Nearly all changed except <http://wiki.openembedded.net/index.php/Community_Servers> which is read only for me.

I have deleted the content on this page and redirected to
http://wiki.openembedded.net/index.php/Infrastructure

-- 
=======================
Cliff Brake
http://bec-systems.com


