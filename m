Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ka6sox@gmail.com>) id 1PhqYh-0003NK-Sc
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 22:36:16 +0100
Received: by fxm17 with SMTP id 17so289191fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 13:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=r26EzJ6MjVXYy2PZdSe4SELbpc3YdDF1qTZGGUF5omA=;
	b=EptEdiRv1TPBZwcpmeF4UV8QmXkzF8cRFE8qGV0XlfO/0mtMbHbQf9gO5FUJqfzwSj
	5WzTjhzzlBdhq+qp9QBfmZwtaRjsK51OQupbv6c2tMo6hb3XWJyOkuc31mpzXCPNCPtw
	rB2ZEWaT6uh657rGtm6AkZNeoDChfK3kNq2RQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SgkjoLvSln9XvEYGbmTUTRS3hT47d2Cb1AYwzxfxzK+qGiaEn0wBLc14sd3fg2ZRHL
	/1oqLxlceuu0ziGNGI5/ZP6l4BZ/bexDFVISNZuAJcZ3K4lu80mGlBO2PdRu38GozCj/
	Uu8HUTFrMTGKqjS01PkgxF+CDuo7Z4AGV0tq0=
MIME-Version: 1.0
Received: by 10.223.101.135 with SMTP id c7mr6414223fao.76.1295991312362; Tue,
	25 Jan 2011 13:35:12 -0800 (PST)
Received: by 10.223.103.14 with HTTP; Tue, 25 Jan 2011 13:35:12 -0800 (PST)
Date: Tue, 25 Jan 2011 13:35:12 -0800
Message-ID: <AANLkTi=C5q1_aVxkf3JCH_M3u+dyCP=neTPX_oUHie65@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Planned outage of Melo server.
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
X-List-Received-Date: Tue, 25 Jan 2011 21:36:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

When: 0330-0430UTC  25jan2011
Why: to install drbd modules and ganeti configs for increased reliability.

Git, Wiki, bugzilla, tinderbox will all be offline during that period.

ka6sox
(for the openembedded.org infrastructure team)

