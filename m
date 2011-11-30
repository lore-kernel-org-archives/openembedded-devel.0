Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1RViPL-0007MI-Rv
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 12:33:00 +0100
Received: by iahk25 with SMTP id k25so612088iah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 03:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=mFO0yJJ41JP3EpH5WF+LppgCP6KYFWGpdTEVr3wzyAQ=;
	b=fWiUTP+0rmHokZoWBIE+976E5AMeCCwW4k+hG+hHiXCFhSheSeZj0evVeWui1o4OvE
	aGQfXuwKPt1c+SizE/P4ZpQWwuoFiAgcu6/TnGs8bSFhsVoGB5KulG7KLy/PuFHI0n4E
	bst0Xma8++FvuoHdwhXopdDSee+cRxZGsk8gI=
MIME-Version: 1.0
Received: by 10.42.176.8 with SMTP id bc8mr2201099icb.12.1322652379389; Wed,
	30 Nov 2011 03:26:19 -0800 (PST)
Received: by 10.231.85.139 with HTTP; Wed, 30 Nov 2011 03:26:19 -0800 (PST)
Date: Wed, 30 Nov 2011 12:26:19 +0100
Message-ID: <CAOHjBZv=FrBpCyUvLwTK=ta1RU-d3zqcpG=ShsHL2BkMDs6BMA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Want to change prefix installation path
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
X-List-Received-Date: Wed, 30 Nov 2011 11:33:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,



I need to change the file installation path of the target packages. I mean,
I need to have set a different path in the .spec file (talking about rpm
installation)

for the installed files contained in the %files directive. I think this
should be obtained setting base_prefix accordingly.



Suggestions are welcome.

May thanks,

Giuseppe

