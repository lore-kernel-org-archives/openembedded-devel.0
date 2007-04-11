Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <tom@openhardware.net>) id 1HbZKk-00016b-9N
	for openembedded-devel@openembedded.org; Wed, 11 Apr 2007 11:41:46 +0200
Received: (qmail 28185 invoked from network); 11 Apr 2007 09:41:44 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 11 Apr 2007 09:41:44 -0000
Message-ID: <461CAD47.7050307@openhardware.net>
Date: Wed, 11 Apr 2007 05:41:27 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4611582F.8010203@openhardware.net>	<f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>	<c384c5ea0704081010y623cdbafq4f9dce1148a593e5@mail.gmail.com>	<461972D6.1060901@openhardware.net>	<461A6F08.3020904@openhardware.net>	<f96d234e0704091138j7118f436j4f4a3cc3edee4446@mail.gmail.com>	<461AE55E.6020301@openhardware.net>
	<461AE6FA.8010009@balister.org>
In-Reply-To: <461AE6FA.8010009@balister.org>
Subject: Re: versioning madness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2007 09:41:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> Tom,
>
> Have you looked at bb collections?
>
> http://bitbake.berlios.de/manual/ch04s02.html#id870544
>
> I think they will do what you want. You can keep separate data and 
> chose which data takes priority in case of duplicate packages.
>

AH! Thank you!  That is exactly what I need.

TomW


-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------




