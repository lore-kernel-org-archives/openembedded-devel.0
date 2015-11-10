Return-Path: <ppf83764@freenet.de>
X-Greylist: delayed 781 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Nov 2015 13:54:41 UTC
Received: from mout1.freenet.de (mout1.freenet.de [195.4.92.91])
	by mail.openembedded.org (Postfix) with ESMTP id 5D34B74197
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:54:41 +0000 (UTC)
Received: from [195.4.92.142] (helo=mjail2.freenet.de)
	by mout1.freenet.de with esmtpa (ID ppf83764@freenet.de) (port 25)
	(Exim 4.85 #1) id 1Zw9B5-0008O8-0m
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2015 14:41:39 +0100
Received: from localhost ([::1]:44317 helo=mjail2.freenet.de)
	by mjail2.freenet.de with esmtpa (ID ppf83764@freenet.de) (Exim 4.85
	#1) id 1Zw9B4-0001mm-Sx
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2015 14:41:38 +0100
Received: from mx3.freenet.de ([195.4.92.13]:36772)
	by mjail2.freenet.de with esmtpa (ID ppf83764@freenet.de) (Exim 4.85
	#1) id 1Zw98q-0005Kf-5S
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2015 14:39:20 +0100
Received: from p57b3caa8.dip0.t-ipconnect.de ([87.179.202.168]:37719
	helo=[192.168.178.21])
	by mx3.freenet.de with esmtpsa (ID ppf83764@freenet.de)
	(TLSv1.2:DHE-RSA-AES128-SHA:128) (port 587) (Exim 4.85 #1)
	id 1Zw98q-0006GQ-1A for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2015 14:39:20 +0100
From: Peter Fink <ppf83764@freenet.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <5641F387.5020904@freenet.de>
Date: Tue, 10 Nov 2015 14:39:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
X-Originated-At: 87.179.202.168!37719
Subject: setting system and qtwebengine default localization
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 13:54:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I've got two locale specific questions which I didn't find any answers 
in the last few days...

#1: Is there a simple approach to set the system locale settings (and 
keyboard layout) for an image without graphical desktop environment at 
compile time rather than using localectl at runtime?

#2: I also need to change the browser language from a qtwebengine 
project. I thought changing the system locale might change the 
"Accept-Language: en-us, en" string, but sadly it doesn't. Is anybody 
aware of a possibility to change the qtwebengine localization?

Thanks in advance and best regards,
Peter Fink

