Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JJSXQ-0004q2-89
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 12:52:32 +0100
Received: by py-out-1112.google.com with SMTP id y77so1980743pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 03:52:35 -0800 (PST)
Received: by 10.35.72.6 with SMTP id z6mr6269901pyk.50.1201521155724;
	Mon, 28 Jan 2008 03:52:35 -0800 (PST)
Received: from ?192.168.1.207? ( [24.107.189.117])
	by mx.google.com with ESMTPS id f77sm14341248pyh.32.2008.01.28.03.52.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 28 Jan 2008 03:52:33 -0800 (PST)
Message-ID: <479DC1FD.4000900@gmail.com>
Date: Mon, 28 Jan 2008 05:52:29 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <479D9AA9.8020704@student.utwente.nl>
In-Reply-To: <479D9AA9.8020704@student.utwente.nl>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [oe-commits] org.oe.dev gnuplot: update 4.2.2, add 4.3.0+cvs
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
X-List-Received-Date: Mon, 28 Jan 2008 11:52:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/28/2008 03:04 AM, Koen Kooi wrote:
> I've seen a few updates to that file, but no mails about that. Let me
> paste the top few lines of
> conf/distro/include/angstrom-2007-preferred-versions.inc:
> 
> # This is a lock-down file for stability purposes
> # If you change anything, send a mail to angstrom-distro-devel@linuxtogo.org
> # stating the change and the reason.
> 
> So please send a mail, it's not hard....

Sorry, I thought angstrom-2007-preferred-versions.inc was still required 
by angstrom-2008.1.conf. But it isn't.

Things I've changed are:

navit: 0.0.1 to 0.0.3 (upstream major release, 0.0.3 built with speechd 
support, tested by CoreDump)
gnuplot: 4.2.0 to 4.2.2 (upstream bugfix release, tested on Tosa)
qpegps: 0.9.3.0 to 0.9.3.1 (upstream bugfix release, 0.9.3.0 segfaults)

Regards
Gordon


