Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LJUgx-0004gv-Lr
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jan 2009 16:15:03 +0100
Received: by qw-out-1920.google.com with SMTP id 14so2768559qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jan 2009 07:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=loLm5/+fJb3VkP0QLoQ8zjgDtx+UJrgWq7OVNr05XmU=;
	b=SxBijZEZl6Qu+X3ZlwkkqNzIQ+cHIjnLk+j/ruZGNOeEqUU9ZUMTvYMpST2DmRh2/I
	ZxsjmVIGOxCPnn993RG1a6CM2fvVSSWp1tJyx4n3j0BbcD4p8ECKUXKu2Q6ABSTtTOP+
	3roFTVEPEav8cGaJ8caYKL0KLvAiu8YoItgIA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=WMChrzjjPvn6V6FFms7n/EDLre+oobUnkXhHvFh8PBtDZhhy39XFNNW8daQ7Nxxd5t
	nFJmeggGBd5SWv6/OhIHaH2xlZLNvmlJt3fuRZ99/Qy4mB7FwlUZ5+8XASAtOZhBXeew
	0et7UhbQyEcskCgq+pObJu+xiQjn8/DfJjR6A=
Received: by 10.214.46.11 with SMTP id t11mr15835107qat.284.1231081751913;
	Sun, 04 Jan 2009 07:09:11 -0800 (PST)
Received: by 10.215.66.18 with HTTP; Sun, 4 Jan 2009 07:09:11 -0800 (PST)
Message-ID: <c384c5ea0901040709h306a048bmf3fbfa0a0489d19a@mail.gmail.com>
Date: Sun, 4 Jan 2009 16:09:11 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: no /temp/run.do_package?
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
X-List-Received-Date: Sun, 04 Jan 2009 15:15:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I wonder, why is there no do_package run script in the temp/ directory?

(I'm debugging the oprofile package for improper packaging.)

Regards,
-- 
Leon


