Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PVKkh-00005P-9D
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 10:12:55 +0100
Received: by iwn8 with SMTP id 8so5212499iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 01:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Oz6sJ/sEXNHuL6upvh/3F0haTp8F1jf62Gpr88R++vM=;
	b=O4oMJ/4BxaAmA2M4fnBU0AuPy9YMFcHj+gPJAOae0L/ZVhQGWU8rYCJJCG6ca3EpH1
	oJVMiXqU7dBIF6RAbenTkUQVIFpEif/ZsyTDgVS1Hgzhh3dpPckZoVGbYdIrBSQgukxT
	hY0I0FzuWHOeJhvtb6+u/ufEcT5L6pPmzeCXc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vUqnwl9ezA+orPdi7/5YkxniDUfFXF5WgwGziWQGmpx9s3BslJjb+FailoQgNDfgUE
	/ClrQLYzjYfrgnRrG5ko66outbc39nbG5ggKoCqQNucuQfihA08Z/Ex3v4E+VY0Wsdo8
	gOgkIevAf2NOJMy7jHjd1zXl4AT1WA796MA7w=
MIME-Version: 1.0
Received: by 10.231.206.7 with SMTP id fs7mr6541680ibb.82.1293009169183; Wed,
	22 Dec 2010 01:12:49 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 22 Dec 2010 01:12:49 -0800 (PST)
In-Reply-To: <AANLkTimMbqWP4JwW6FaDT+_C-uaWZVsVNRjmcUM2F4g_@mail.gmail.com>
References: <20101221150222.GB4665@gmail.com>
	<1292969027-18762-1-git-send-email-eric@eukrea.com>
	<AANLkTimMbqWP4JwW6FaDT+_C-uaWZVsVNRjmcUM2F4g_@mail.gmail.com>
Date: Wed, 22 Dec 2010 10:12:49 +0100
Message-ID: <AANLkTi=y+2gxjMqQoX0ze3DVkzPaycAu=MgTjiPWcjC-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] asterisk: move non working recipes to nonworking directory
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
X-List-Received-Date: Wed, 22 Dec 2010 09:12:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/22 Khem Raj <raj.khem@gmail.com>:
> On Tue, Dec 21, 2010 at 2:03 PM, Eric B=E9nard <eric@eukrea.com> wrote:
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


