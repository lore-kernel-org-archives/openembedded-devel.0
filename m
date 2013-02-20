Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1U89vg-0003OP-Te
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 14:41:49 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A393CF8122A; Wed, 20 Feb 2013 06:25:39 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 88D6FF81226;
	Wed, 20 Feb 2013 06:25:38 -0700 (MST)
Message-ID: <5124CEDA.2060707@mlbassoc.com>
Date: Wed, 20 Feb 2013 06:25:46 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1358786627-20844-1-git-send-email-fahad_usman@mentor.com>
	<51248946.8090005@mentor.com> <20130220093405.48359dc5@e6520eb>
In-Reply-To: <20130220093405.48359dc5@e6520eb>
Subject: Re: [meta-browser][PATCH] nss: fix access to https websites
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
X-List-Received-Date: Wed, 20 Feb 2013 13:41:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013-02-20 01:34, Eric B=C3=A9nard wrote:
> Hi Fahad,
>
> Le Wed, 20 Feb 2013 13:28:54 +0500,
> "Usman, Fahad" <Fahad_Usman@mentor.com> a =C3=A9crit :
>
>> On 01/21/2013 09:43 PM, Fahad Usman wrote:
>>> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
>>> ---
>>>    recipes-support/nss/nss_3.13.3.bb |    4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>> Can someone review this patch.
>>
> I applied it a few weeks ago :
> https://github.com/OSSystems/meta-browser/commit/d2061edf243ee12caa1a89=
439ffb6af8945b8054

Works great as well - both FireFox and Chromium now work fine with HTTPS

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


