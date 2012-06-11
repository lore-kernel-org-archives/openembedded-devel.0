Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Se7uS-0003Z6-Nt
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 18:56:08 +0200
Received: by vcbfl15 with SMTP id fl15so2211267vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 09:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Vz1kokl7fMxP06FJ02W+pRUfgg1smN7pzp45N+by4p4=;
	b=w/UzKEihZbWDmV1T8DtoOCBVjTfpQkPmc+V1JPt4gyYreSBdcPcLyUgcdNw/NhFdKb
	PY6kMXLSV5IxgagrcKQwC+CkgEvgIJlBXq+iaRvW+wlXld8AMgW+mdCMQzcbWnkKzs4Q
	SKUsPKTUG97CUxaxfMq0coULyhenwDPPTWISw/fsemOSWrJT8qU5oQjBBRbEuXfyufyR
	rfzHEl5G+djUNTqYytfQ8/WNu4zJR0aj0tfkWTr58FcegeotBlyTuJ7WC+C7N4cPPGes
	eXjbP76JpL59X/HjW99A4GaMWa+I+Fd5eK0pYl4B/50FfXNutbuayDszHUu6XccSTh1h
	4qbA==
MIME-Version: 1.0
Received: by 10.52.95.110 with SMTP id dj14mr10884611vdb.69.1339433134606;
	Mon, 11 Jun 2012 09:45:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.155.130 with HTTP; Mon, 11 Jun 2012 09:45:34 -0700 (PDT)
In-Reply-To: <jr576n$tsp$1@dough.gmane.org>
References: <cover.1339428767.git.otavio@ossystems.com.br>
	<5c52e769ac49b8f283659530cf3d959c2280db48.1339428767.git.otavio@ossystems.com.br>
	<jr576n$tsp$1@dough.gmane.org>
Date: Mon, 11 Jun 2012 13:45:34 -0300
X-Google-Sender-Auth: VeOZ7IM7n9XoaPdnR9TLkaZ08kg
Message-ID: <CAP9ODKqVRWVahci5uoxDdiZ+yJK5hHNpXVTtVr7wGVKQ9ErdRQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][meta-oe 1/3] owfs: add init script for owfs
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
X-List-Received-Date: Mon, 11 Jun 2012 16:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 11, 2012 at 1:43 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> > b/meta-oe/recipes-extended/owfs/owfs/owfs new file mode 100755 index
> > 0000000..766bbbb --- /dev/null +++
> > b/meta-oe/recipes-extended/owfs/owfs/owfs
>
> That's missing LSB headers


I just copied the other init scripts.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

