Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <xjqian@gmail.com>) id 1HfuTQ-0006i3-8B
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2007 11:04:40 +0200
Received: by py-out-1112.google.com with SMTP id n39so1173837pyh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2007 02:04:39 -0700 (PDT)
Received: by 10.65.114.11 with SMTP id r11mr11121388qbm.1177309849118;
	Sun, 22 Apr 2007 23:30:49 -0700 (PDT)
Received: from ?192.168.10.106? ( [24.107.178.232])
	by mx.google.com with ESMTP id 36sm8811459nza.2007.04.22.23.30.47;
	Sun, 22 Apr 2007 23:30:48 -0700 (PDT)
Message-ID: <462C5269.5070701@gmail.com>
Date: Mon, 23 Apr 2007 01:30:01 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: ipkg-build missing in tosa OZ 3.5.5 conf
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Apr 2007 09:04:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

bitbake nano failed with missing ipkg-build. 

Although I closed the bug report myself by downloading ipkg-build shell 
script from the internet, I would like to know whether it's my host 
problem or a dependency misbehavior. It could be because my bitbake-1.8 
at revision 802 is too old.

see bug report here:  http://bugs.openembedded.org/show_bug.cgi?id=2132

Gordon


