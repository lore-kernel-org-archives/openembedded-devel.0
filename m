Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1L0ind-0002EC-B2
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Nov 2008 21:28:21 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id DDA23401F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2008 16:27:06 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 3FC7AC1F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2008 18:26:16 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id ABCEA61005E; Thu, 13 Nov 2008 18:22:30 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>
	<491C1379.2090404@gmx.de> <87hc6b4njt.fsf@neumann.lab.ossystems.com.br>
	<491C7E1A.2020308@gmx.de>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 13 Nov 2008 18:22:30 -0200
In-Reply-To: <491C7E1A.2020308@gmx.de> (Thomas Kunze's message of "Thu\,
	13 Nov 2008 20\:20\:58 +0100")
Message-ID: <87od0jxto9.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Issues with the system startup when the IMAGE_TYPE is	squashfs
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
X-List-Received-Date: Thu, 13 Nov 2008 20:28:21 -0000
Content-Type: text/plain; charset=us-ascii

Thomas Kunze <thommycheck@gmx.de> writes:

> This is just a simple rename.
>>  - make it a distro option; not a requirement
>>
>>   
> I don't agree with that. It really don't see how this patch could
> break images. If it works I see no reason why any distro doesn't want
> to have this.

This is a behaviour change and before making it a requirement it needs
to be tested.

Personally I also see no reason for it to break images but it is
always better be safe then sorry.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


