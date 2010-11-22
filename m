Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PKaGF-0002K0-M2
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 18:33:04 +0100
Received: (qmail 31009 invoked by uid 503); 22 Nov 2010 17:36:19 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 22 Nov 2010 17:36:18 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Nov 2010 19:31:53 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 22 Nov 2010 19:31:52 +0200
Message-ID: <4CEAA907.4080808@eukrea.com>
Date: Mon, 22 Nov 2010 18:31:51 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE64779.3020802@sensortherm.de>	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>	<4CE7D1F2.7010305@sensortherm.de>	<AANLkTi=VB3EJo1DU2pGWgCSqFrZX81t1Es4xTHP3eCWU@mail.gmail.com>	<4CEA2BFF.5090707@sensortherm.de>	<AANLkTimabe75SmdGTA5EemH83-4Yd7KjNwdx8D3dCNR6@mail.gmail.com>	<4CEA88D0.7070100@sensortherm.de>
	<AANLkTinRPF12o0qhpPq=qohG9E6tXRYTd58uB0itKEQ1@mail.gmail.com>
In-Reply-To: <AANLkTinRPF12o0qhpPq=qohG9E6tXRYTd58uB0itKEQ1@mail.gmail.com>
X-Ovh-Tracer-Id: 12179985192793255241
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
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
X-List-Received-Date: Mon, 22 Nov 2010 17:33:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2010 18:25, Frans Meulenbroeks wrote:
> Note that some of the errors Klaus reported are due to the outage of
> www.handhelds.org.
>
as a workaround, here adding this to the local.conf works :

INHERIT += "own-mirrors"
SOURCE_MIRROR_URL = "http://sources.openembedded.org/"

Can peoples having problem with update-rc.d try this and report here if that 
solves their problem ?

Thanks,
Eric


