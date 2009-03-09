Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LgmBw-0001u1-BU
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 21:35:16 +0100
Received: by bwz9 with SMTP id 9so1293454bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2009 13:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=/xw0iC03btT8i/jlYFicHnh+s1JiBZOPBS3QoIWzCPM=;
	b=L66tBMmeec+6U+Oxx4mcqoDGRAKBkXU43TGYJo7n+Cn4UyG2VQJMplwhmyfmmRcnTM
	qh04c89X+ypHENjQT5iS9+8/l8olTzBIjuTeLC31bmP3UMqK5sNy7XtvwwXsLp0/NYmG
	j2i2sAeHkZaIkWwZdL8fTIN/xMoyvJZKfI+Aw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=idUvSdxkqAiCbWj+XqpuEJ7a8bYNgSB5b8JTqZfBS0DRtQ26q8ba+AStBzXPrXne8o
	IvF5Sp0TvJRgJznm/MSzTcmfE2S/bh9Lwq8k8X89/Ox1LMe1LQqE6vdjzHHRWHK98UoR
	CJQyBnQmG+QzL2/jdUXFYaRpHTkU4Yt+cWAa0=
MIME-Version: 1.0
Received: by 10.223.111.134 with SMTP id s6mr4846761fap.37.1236630616161; Mon, 
	09 Mar 2009 13:30:16 -0700 (PDT)
Date: Mon, 9 Mar 2009 21:30:16 +0100
Message-ID: <ac9c93b10903091330g11afcac9w4e4f1fba9a468e9f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: python-zopeinterface
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
X-List-Received-Date: Mon, 09 Mar 2009 20:35:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I noticed that python-zopeinterface installs in /usr/lib/python2.6.
I'm not a python wiz, but shouldn't this install in
/usr/lib/python2.6/site-packages ?

If so, can someone fix ?

Thanks FM


