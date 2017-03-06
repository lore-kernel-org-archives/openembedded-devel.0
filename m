Return-Path: <yann.peron@optimatic.fr>
X-Greylist: delayed 349 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Mar 2017 06:55:55 UTC
Received: from 1.mo2.mail-out.ovh.net (1.mo2.mail-out.ovh.net [46.105.63.121])
	by mail.openembedded.org (Postfix) with ESMTP id D9C65775FA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 06:55:55 +0000 (UTC)
Received: from player157.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 7E84C5D22E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:50:07 +0100 (CET)
Received: from [10.8.0.6] (arl95-2-82-239-171-38.fbx.proxad.net
	[82.239.171.38]) (Authenticated sender: yann.peron@optimatic.fr)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id 9F1AC500089
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:50:06 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1488363425-824-1-git-send-email-yann.peron@optimatic.fr>
	<20170304115436.GD3025@jama>
	<41d7f160-1178-ed2a-d60e-7232adde20db@mlbassoc.com>
From: Yann PERON <yann.peron@optimatic.fr>
Message-ID: <7b6bd7ea-2bb2-f1ed-435f-ddafd8725f12@optimatic.fr>
Date: Mon, 6 Mar 2017 07:50:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <41d7f160-1178-ed2a-d60e-7232adde20db@mlbassoc.com>
X-Ovh-Tracer-Id: 477100089749575752
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 50
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrfeelgdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecuogetvdelhedqtdekucdlhedtmd
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] Ajout de qtSerialBus dans la toolchain
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Mar 2017 06:55:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Thank you, It is the first time I post on this mailing List, I didn't 
know the requirements.

When corrections will be applied, how send again the patch? reply to 
this email discussion ? or send in a new email?

Thank you

Le 04/03/2017 à 13:28, Gary Thomas a écrit :
> On 2017-03-04 12:54, Martin Jansa wrote:
>> On Wed, Mar 01, 2017 at 11:17:05AM +0100, Yann PERON wrote:
>>> ---
>>
>> Please use English.
>
> That's only part of what's off/missing here:
>   * No Signed-off-by
>   * No explanation of the change
>   * Improper subject [protocol]
>
>>
>>>  recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git 
>>> a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb 
>>> b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
>>> index 1521dbf..2735135 100755
>>> --- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
>>> +++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
>>> @@ -83,6 +83,8 @@ RDEPENDS_${PN} += " \
>>>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 
>>> 'qtsensors-qmlplugins', '', d)} \
>>>      qtserialport-dev \
>>>      qtserialport-mkspecs \
>>> +    qtserialbus-dev \
>>> +    qtserialbus-mkspecs \
>>>      qtsvg-dev \
>>>      qtsvg-mkspecs \
>>>      qtsvg-plugins \
>>> -- 
>>> 2.1.4
>
**

