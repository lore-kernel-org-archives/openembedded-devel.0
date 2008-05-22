Received: from [212.227.126.188] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1Jz6Ek-00021n-8M
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 May 2008 10:33:26 +0200
Received: from [10.0.0.200] (X14d7.x.pppool.de [89.59.20.215])
	by mrelayeu.kundenserver.de (node=mrelayeu8) with ESMTP (Nemesis)
	id 0ML31I-1Jz6C903xK-00019O; Thu, 22 May 2008 10:30:41 +0200
Message-ID: <48352F30.1070202@linuxdevelopment.de>
Date: Thu, 22 May 2008 10:30:40 +0200
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080226)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48346060.1030101@bolloretelecom.eu>
In-Reply-To: <48346060.1030101@bolloretelecom.eu>
X-Enigmail-Version: 0.95.6
X-Provags-ID: V01U2FsdGVkX1///4Bw5iN61ZUuqAkcohc8rBpvi42kk0PUkwS
	eaeVlSM5UnmICN/pfOu0xhhk8/n0npvwSgcGHJEpVASDw2Uu1Z
	AT9JlGPPSUodznFVWdiQ2IHg6HDDtHAWNduwCJvzis=
Subject: Re: oestats: build statistics for OpenEmbedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 22 May 2008 08:33:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

nice job Jeremy
that looks very promising maybe with that we can secure configs and 
snapshots which do work.

Is it possible to sort the buildreports on machine`s and also add which 
host was used ( i686 or i686-64 ) ?
and which target was build ( gpe-image - task-boot ) ???

Cheers Robert

Jeremy Lainé schrieb:
> Hi all!
> 
> I happy to announce the availability of "oestats", a web application
> for collecting and viewing OpenEmbedded build reports. In keeping with
> OE / bitbake it is written in Python and uses the Django web framework.
> 
> A live demo is available at:
> 
> http://oestats.jerryweb.org/
> 
> If you want to add your build stats, make sure your copy of OE is up
> to date and add the following to your build/conf/local.conf:
> 
> |INHERITS += "oestats-client"
> OESTATS_SERVER = "oestats.jerryweb.org"
> OESTATS_BUILDER = "your_nickname"|
> 
> Fair warning: this is a test server, no promises on availability
> though I'll do my best :)
> 
> Source code and setup notes for the server are available at:
> 
> http://opensource.bolloretelecom.eu/projects/oestats/
> 
> Your feedback and improvements are most welcome!
> 
> Cheers,
> 


