Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RtV31-0000QU-GS
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 03:08:15 +0100
Received: by lbol12 with SMTP id l12so674068lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 18:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pXePIAC5ZIEiDIpyrtfOy+tw5KeTwEcJDpxvs1eZQ/o=;
	b=dh2lNhZXMmHfT4fkAPjUmWfkYCw4ARMxJp7/c8ZuVrLpGPCI7160m1/DVMOk4xZikY
	Cwe8SCbldlOoZK2KCnwxphJ3Vv0XpjIoQtLuvK+Fs0pJ9SNOrtlNjCoWmLBvF9NknkFP
	UILw7U7hFZmYDNMn025mmtfdM1Zsx1SyMgPqI=
MIME-Version: 1.0
Received: by 10.112.83.197 with SMTP id s5mr2538426lby.9.1328320817517; Fri,
	03 Feb 2012 18:00:17 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Fri, 3 Feb 2012 18:00:17 -0800 (PST)
In-Reply-To: <jghu9u$dqo$2@dough.gmane.org>
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
	<20120203154742.GM3893@jama.jama.net>
	<CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
	<CAAQYJAvfYLRcYw7fKVogjkwuST-b4oYMCH4_VZG6P8Xy5QgjgQ@mail.gmail.com>
	<jghu9u$dqo$2@dough.gmane.org>
Date: Sat, 4 Feb 2012 03:00:17 +0100
Message-ID: <CALbNGRQ+qOr43Nkr5ja6E8V_VVD-e2ZTaFCd1Lga=CYaRVFt-w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : systemd.bbclass: depends on systemd
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
X-List-Received-Date: Sat, 04 Feb 2012 02:08:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

>> Which recipes really depend on systemd during build? I know about
>> polkit, something else?

udisks [1]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-January/037230.html

Andreas


