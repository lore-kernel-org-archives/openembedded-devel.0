Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lpotter@trolltech.com>) id 1IDU1h-0003EI-Vr
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jul 2007 01:42:50 +0200
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 7C5C5742A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2007 01:41:38 +0200 (CEST)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP id 1A389742A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2007 01:41:38 +0200 (CEST)
Received: from [10.1.1.181] (polarbear-replace.trolltech.com.au [10.1.1.181])
	by mail.trolltech.com.au (Postfix) with ESMTP id A650D35488E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2007 09:41:35 +1000 (EST)
Message-ID: <46A68E2F.5000005@trolltech.com>
Date: Wed, 25 Jul 2007 09:41:35 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Thunderbird 2.0.0.0 (X11/20070326)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <d543f5920707171347k2845264cgbce3c02d76818810@mail.gmail.com>	<469D3681.3030004@klever.net>	<d543f5920707171458q3c13f402x16c8c8fb37f280ea@mail.gmail.com>	<469D3D80.7040104@klever.net>	<1185200908.6148.56.camel@localhost.localdomain>
	<46A5F7CF.5000105@klever.net>
In-Reply-To: <46A5F7CF.5000105@klever.net>
Subject: Re: Building auxiliary tools in qmake2-native
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
X-List-Received-Date: Tue, 24 Jul 2007 23:42:51 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Michael Krelin wrote:
>> Will the opie-lrelease-native work? If not, a lrelease-native package
>> sounds like the way to go.
> 
> I'd guess opie-lrelease-native is a bit outdated for qt4, but I've never 
> used it, so I'm not sure.

Yes, lrelease is version specific.


> That wasn't a question of whether we should use build system's qt tools, 
> it was about not splitting qt into many native packages, but rather 
> using a single qt-native, since, for instance, qmake2-native has to 
> build half a qt, anyway, to support qt3 compatibility layer. I don't 
> think dropping qt3support is a feasible option. If not, then, of course 
> adding a missing lrelease-native is the way to go.


If you configure with qt3-support in qt4, I think you won't get all of 
Qt 4's features, but I could be wrong, or it might have changed.



-- 
Lorn 'ljp' Potter
Software Engineer, Systems Group, MES, Trolltech



