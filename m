Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QmuXY-00042x-SV
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 23:24:17 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QmuTQ-00024l-VJ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 14:20:01 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 29 Jul 2011 14:17:00 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 29 Jul 2011 14:20:00 -0700
Message-ID: <4E3323F6.5050407@mentor.com>
Date: Fri, 29 Jul 2011 14:19:50 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1311884386-21622-1-git-send-email-bengardiner@nanometrics.ca>
In-Reply-To: <1311884386-21622-1-git-send-email-bengardiner@nanometrics.ca>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 29 Jul 2011 21:17:00.0952 (UTC)
	FILETIME=[DB2FF180:01CC4E34]
Subject: Re: [2011.03-maintenance]
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
X-List-Received-Date: Fri, 29 Jul 2011 21:24:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/28/2011 01:19 PM, Ben Gardiner wrote:
> Cherry-pick: f1d24b5a986233f869364eb109476f5184e76d10
> Tested-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
> please add this to the 2011.03-maintenance branch
> 
> Ben Gardiner (1):
>   raptor: add libxml2 DEPENDS
> 
>  recipes/raptor/raptor_1.4.21.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOMyPuAAoJEI4NMjfc3nJxDyQH/A0XKovaPl5gz9JmXaOU8gIa
d6xcftM8qgilCl244zGPCg6GqgjsFrlitxo51gZmcsXB9Uhg9lczC94ywicvoXTt
EhbmkegBO0B5VSFk1cvVm92/NRJen7WnwRWR99DCn8wWYevx59RXU3cvRNFNHgS/
Q+Wue5HGiYullZM3zTES8C90bLwvIAHey1dgp5HjHoFVSE5BklgqfgJl+4fwe63X
2fH7DBC+dhFQD4bq5Qr1TRzucc8mQ5vS1EDHdV3xPj3EUbOwucJcOAMNm7yzpKxj
s+c4CVI6RI1FKG6KWyZS13UCUa5e59hvOKnY9Rwd50aAsW/CmJYgUWNlfqdr6H8=
=RV/E
-----END PGP SIGNATURE-----


